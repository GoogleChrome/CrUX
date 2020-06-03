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

const CrUXApiUtil = require('./cruxApiUtil.js');
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

// Confirm the API key.
if (!argv.key) {
  console.log('An API Key is required to use the Chrome UX Report API.');
  return;
}

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

// Gather the data and display it.
(async function () {
  const json = await CrUXApiUtil.query(request, argv.key);

  const labeledMetrics = await CrUXApiUtil.labelMetricData(json.record.metrics);

  // The CWV 75%ile thresholds.
  const nameToCWVMap = {
    largest_contentful_paint: 2500,
    first_input_delay: 100,
    cumulative_layout_shift: '0.1',
  };

  // Display metric results
  let identifierType = 'Origin';
  let identifier = json.record.key.origin;
  if (json.record.key.url) {
    identifierType = 'Url';
    identifier = json.record.key.url;
  }
  let formFactor = 'ALL';
  if (json.record.key.formFactor) {
    formFactor = json.record.key.formFactor;
  }
  // Add form factor too...
  console.log('\n' + `${identifierType}: ${identifier}, FormFactor: ${formFactor}`);
  for (const metric of labeledMetrics) {
    if (nameToCWVMap[metric.name]) {
        // Check pass fail
        let result = chalk.red('failed');
        let resultComparator = "!<=";
        if (metric.percentiles.p75 <= nameToCWVMap[metric.name]) {
          result = chalk.green('passes');
          resultComparator = "<=";
        }
        console.log(`Metric "${metric.name}" ${result} the Core Web Vitals assessment. (${metric.percentiles.p75} ${resultComparator} ${nameToCWVMap[metric.name]})`);

    }
  }
  // The final result for this query.
  // If everything passed, then CWV passes, otherwise fail!
  let result = 'Core Web Vitals Assessment: ';
  if (labeledMetrics.every(metric => nameToCWVMap[metric.name] ? metric.percentiles.p75 <= nameToCWVMap[metric.name] : true)) {
    result += chalk.green('PASSED');
  } else {
    result += chalk.red('FAILED');
  }
  console.log('\n' + result);
})();
