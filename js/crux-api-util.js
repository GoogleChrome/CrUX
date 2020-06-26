// Copyright 2020 Google LLC.
// SPDX-License-Identifier: Apache-2.0

const CrUXApiUtil = {};
// Get your CrUX API key at https://goo.gle/crux-api-key.
CrUXApiUtil.API_KEY = '[YOUR_API_KEY]';
CrUXApiUtil.API_ENDPOINT = `https://chromeuxreport.googleapis.com/v1/records:queryRecord?key=${CrUXApiUtil.API_KEY}`;
CrUXApiUtil.query = function (requestBody) {
  if (CrUXApiUtil.API_KEY == '[YOUR_API_KEY]') {
    throw 'Replace "YOUR_API_KEY" with your private CrUX API key. Get a key at https://goo.gle/crux-api-key.';
  }
  return fetch(CrUXApiUtil.API_ENDPOINT, {
    method: 'POST',
    body: JSON.stringify(requestBody)
  }).then(response => response.json()).then(response => {
    if (response.error) {
      return Promise.reject(response);
    }
    return response;
  });
};
