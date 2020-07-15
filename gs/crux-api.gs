// Copyright 2020 Google LLC.
// SPDX-License-Identifier: Apache-2.0

const URLs = [
  'https://web.dev/',
  'https://web.dev/fast/',
  'https://developers.google.com/web/'
];
const ORIGINS = [
  'https://web.dev',
  'https://developers.google.com'
];
const FORM_FACTORS = [
  'DESKTOP',
  'PHONE',
  'ALL_FORM_FACTORS'
];

const CrUXApiUtil = {};
// Get your CrUX API key at https://goo.gle/crux-api-key.
// Set your CrUX API key at File > Project properties > Script properties.
CrUXApiUtil.API_KEY = PropertiesService.getScriptProperties().getProperty('CRUX_API_KEY');
CrUXApiUtil.API_ENDPOINT = `https://chromeuxreport.googleapis.com/v1/records:queryRecord?key=${CrUXApiUtil.API_KEY}`;
CrUXApiUtil.query = function (requestBody) {
  if (!CrUXApiUtil.API_KEY) {
    throw 'Script property `CRUX_API_KEY` not set. Get a key at https://goo.gle/crux-api-key.';
  }
  let response = UrlFetchApp.fetch(CrUXApiUtil.API_ENDPOINT, {
    method: 'POST',
    payload: requestBody
  })
  response = JSON.parse(response.getContentText());
  if (response.error) {
    throw `Error: ${response.error.message} ${JSON.stringify(requestBody, null, 2)}`;
  }
  return response;
};

function monitor() {
  FORM_FACTORS.forEach(function(formFactor) {
    URLs.forEach(function(url) {
      getCrUXData('url', url, formFactor);
    });
    ORIGINS.forEach(function(origin) {
      getCrUXData('origin', origin, formFactor);
    });
  });
}

function getCrUXData(key, value, formFactor) {
  const response = callAPI({
    [key]: value,
    formFactor
  });
  
  if (!response) {
    return;
  }
  
  const lcp = getMetricData(response.record.metrics.largest_contentful_paint);
  const fid = getMetricData(response.record.metrics.first_input_delay);
  const cls = getMetricData(response.record.metrics.cumulative_layout_shift);
  addRow(value, formFactor,
         lcp.good, lcp.ni, lcp.poor, lcp.p75,
         fid.good, fid.ni, fid.poor, fid.p75,
         cls.good, cls.ni, cls.poor, cls.p75);
}

function callAPI(request) {
  try {
    return CrUXApiUtil.query(request);
  } catch (error) {
    console.error(error);
  }
}

function getMetricData(metric) {
  if (!metric) {
    return {};
  }
  
  return {
    good: metric.histogram[0].density,
    ni: metric.histogram[1].density,
    poor: metric.histogram[2].density,
    p75: metric.percentiles.p75
  };
}

function addRow(...args) {
  const spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  const sheet = spreadsheet.getActiveSheet();
  sheet.appendRow([
    Utilities.formatDate(new Date(), 'GMT', 'yyyy-MM-dd'),
    ...args
  ]);
}
