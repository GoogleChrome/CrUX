// Copyright 2020 Google LLC

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

const fetch = require('node-fetch');
const chalk = require('chalk');

/**
 * Query the CrUX API for metric records.
 *
 * @param {{origin?: string, url?: string, formFactor?: string,  metrics?: Array<string>}} requestBody
 * @param {string} key
 * return {{record: {key: Object, metrics: Map<string, {histogram: Array<{ start: number, end?: number, density: number}>}>}, urlNormalizationDetails: Object}} */
async function query(requestBody, key) {
  const endpointUrl = 'https://chromeuxreport.googleapis.com/v1/records:queryRecord';
  const resp = await fetch(`${endpointUrl}?key=${key}`, {
    method: 'POST',
    body: JSON.stringify(requestBody),
  });

  const json = await resp.json();
  if (!resp.ok) {
    console.log(chalk.red(json.error.message));
    if (resp.status === 404) {
      // Extra Not Found flavor text.
      console.log('Data cannot be found for this URL. ' +
        'Check that the URL you\'re looking up is correct, ' +
        'don\'t forget "www" if you need it!');
    }
    process.exit(1);
  }
  return json;
};

/**
 * Utility method to transform the response's metric data into an array of usable metric objects
 * Example return value:
  [
    {
      "acronym": "FCP",
      "name": "first_contentful_paint",
      "labeledBins": [{
        "label": "good",
        "percentage": 43.51,
        "start": 0,
        "end": 1000,
        "density": 0.4351
      }, // ... (other bins) ]
      "percentiles": {
          "p75": 1792
      },
    }, // ... (other metrics) ]
*
* @return {{acronym: string, name: string, labelsBins: Array<{label: 'good'|'needs improvement'|'poor', percentage: number, start: number, end?: number, density: number}>}}*/
function labelMetricData(metrics) {
  const nameToAcronymMap = {
    first_contentful_paint: 'FCP',
    largest_contentful_paint: 'LCP',
    first_input_delay: 'FID',
    cumulative_layout_shift: 'CLS',
  };

  return Object.entries(metrics).map(([metricName, metricData]) => {
    const standardBinLabels = ['good', 'needs improvement', 'poor'];
    const metricBins = metricData.histogram;

    // We assume there are 3 histogram bins and they're in order of: good => poor
    const labeledBins = metricBins.map((bin, i) => {
      // Assign a good/poor label, calculate a percentage, and add retain all existing bin properties
      return {
        label: standardBinLabels[i],
        percentage: bin.density * 100,
        ...bin,
      };
    });

    return {
      acronym: nameToAcronymMap[metricName],
      name: metricName,
      labeledBins,
      percentiles: {
          p75: metricData.percentiles.p75,
      },
    };
  });
}

module.exports = {
  query,
  labelMetricData
};
