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
var argv = require('yargs').options({
  'o': {
    alias: 'origin',
    describe: 'The origin to look up.',
    type: 'string'
  },
  'u': {
    alias: 'url',
    describe: 'The URL to look up.',
    type: 'string'
  }, 'f': {
    alias: 'formFactor',
    describe: 'The form factor to lookup, leave blank to lookup all form factors.',
    type: 'string',
    choices: ['PHONE', 'DESKTOP', 'TABLET'],
  }, 'k': {
    alias: 'key',
    demandOption: true,
    describe: 'The API key to use with the request.',
    type: 'string',
  }}).argv;

// Setup the API Util object.
const CrUXApiUtil = {};

// Setup the API key.
if (!argv.key) {
  console.log('An API Key is required to use the Chrome UX Report API.');
  return;
}
CrUXApiUtil.KEY = argv.key;

// Create request to send to API.
let request = {}

// Set the identifier.
if (argv.origin) {
  request.origin = argv.origin;
} else if (argv.url) {
  request.url = argv.url;
} else {
  console.log('A URL or origin identifier is required.');
  return;
}

// Set optional form factor.
if (argv.formFactor) {
  request.formFactor = argv.formFactor;
}

/**
 * Query the CrUX API for metric records.
 *
 * @param {{origin?: string, url?: string, formFactor?: string,  metrics?: Array<string>}} requestBody
 * return {{record: {key: Object, metrics: Map<string, {histogram: Array<{ start: number, end?: number, density: number}>}>}, urlNormalizationDetails: Object}} */
CrUXApiUtil.query = async function (requestBody) {
  const endpointUrl = 'https://chromeuxreport.googleapis.com/v1/records:queryRecord';
  const resp = await fetch(`${endpointUrl}?key=${CrUXApiUtil.KEY}`, {
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

// Gather the data and display it.
(async function () {
  const json = await CrUXApiUtil.query(request);

  const labeledMetrics = await labelMetricData(json.record.metrics);

  // The CWV 75%ile thresholds.
  const nameToCWVMap = {
    largest_contentful_paint: 2500,
    first_input_delay: 100,
    cumulative_layout_shift: '0.1',
  };

  // Display metric results
  let resId = '';
  let identifier = '';
  if (json.record.key.origin) {
    resId += 'Origin: ' + json.record.key.origin;
    identifier = json.record.key.origin;
  } else {
    resId += 'Url: ' + json.record.key.url;
    identifier = json.record.key.url;
  }
  if (json.record.key.formFactor) {
    resId += ', FormFactor: ' + json.record.key.formFactor;
  }
  // Add form factor too...
  console.log('\n' + resId);
  let pass = true;
  for (const metric of labeledMetrics) {
    // console.log("Metric: " + JSON.stringify(metric, null, 2));
    if (nameToCWVMap[metric.name]) {
        // Check pass fail
        if (metric.percentiles.p75 <= nameToCWVMap[metric.name]) {
            console.log('Metric "' + metric.name + '" ' + chalk.green('passes') + ' the Core Web Vitals assessment. (' + metric.percentiles.p75 + ' <= ' + nameToCWVMap[metric.name] + ')');
        } else {
            console.log('Metric "' + metric.name + '" ' + chalk.red('failed') + ' the Core Web Vitals assessment. (' + metric.percentiles.p75 + ' !<= ' + nameToCWVMap[metric.name] + ')');
            pass = false;
        }
    }
  }
  // The final result for this query.
  // If everything passed, then CWV passes, otherwise fail!
  let result = 'Core Web Vitals Assessment: ';
  if (pass) {
    result += chalk.green('PASSED');
  } else {
    result += chalk.red('FAILED');
  }
  console.log('\n' + result);
})();
