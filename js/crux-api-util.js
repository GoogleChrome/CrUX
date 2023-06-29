// Copyright 2020 Google LLC.
// SPDX-License-Identifier: Apache-2.0

const CrUXApiUtil = {};
// Get your CrUX API key at https://goo.gle/crux-api-key.
CrUXApiUtil.API_KEY = '[YOUR_API_KEY]';
CrUXApiUtil.API_HOST = 'https://chromeuxreport.googleapis.com';
CrUXApiUtil.HISTORY_API_ENDPOINT_PATH = `/v1/records:queryHistoryRecord?key=${CrUXApiUtil.API_KEY}`;
CrUXApiUtil.HISTORY_API_ENDPOINT = `${CrUXApiUtil.API_HOST}${CrUXApiUtil.HISTORY_API_ENDPOINT_PATH}`;
CrUXApiUtil.API_ENDPOINT_PATH = `/v1/records:queryRecord?key=${CrUXApiUtil.API_KEY}`;
CrUXApiUtil.API_ENDPOINT = `${CrUXApiUtil.API_HOST}${CrUXApiUtil.API_ENDPOINT_PATH}`;
CrUXApiUtil.API_BATCH_ENDPOINT = `${CrUXApiUtil.API_HOST}/batch/`;

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

CrUXApiUtil.queryHistory = function (requestBody) {
  if (CrUXApiUtil.API_KEY == '[YOUR_API_KEY]') {
    throw 'Replace "YOUR_API_KEY" with your private CrUX API key. Get a key at https://goo.gle/crux-api-key.';
  }
  return fetch(CrUXApiUtil.HISTORY_API_ENDPOINT, {
    method: 'POST',
    body: JSON.stringify(requestBody)
  }).then(response => response.json()).then(response => {
    if (response.error) {
      return Promise.reject(response);
    }
    return response;
  });
};

CrUXApiUtil.batch = function (requests) {
  if (CrUXApiUtil.API_KEY == '[YOUR_API_KEY]') {
    throw 'Replace "YOUR_API_KEY" with your private CrUX API key. Get a key at https://goo.gle/crux-api-key.';
  }

  const BOUNDARY = 'BATCH_BOUNDARY';
  return fetch(CrUXApiUtil.API_BATCH_ENDPOINT, {
    method: 'POST',
    headers: {
      'Content-Type': `multipart/mixed; boundary="${BOUNDARY}"`
    },
    body: `--${BOUNDARY}\n` + requests.map((requestBody, i) => {
      return `
POST ${CrUXApiUtil.API_ENDPOINT_PATH} HTTP/1.1
Content-ID: crux-${i}
Content-Type: application/json

${JSON.stringify(requestBody)}`;
    }).join(`\n\n--${BOUNDARY}\n`) + `\n\n--${BOUNDARY}--`
  }).then(response => {
    const contentTypeHeader = response.headers.get('Content-Type');
    const boundaryPattern = /\bboundary=([\w-]+)\b/i;
    if (!boundaryPattern.test(contentTypeHeader)) {
      throw `Unable to parse boundary directive from Content-Type response header: "${contentTypeHeader}"`;
    }

    const boundary = contentTypeHeader.match(boundaryPattern)[1];
    return Promise.all([
      Promise.resolve(boundary),
      response.text()
    ]);
  }).then(([boundary, response]) => {
    const responseParts = response.split(`--${boundary}`);
    // Eject boundary bookends
    responseParts.shift();
    responseParts.pop();

    const responseJSONPattern = /\n({[\s\S]*)/m;
    return responseParts.map(part => {
      if (!responseJSONPattern.test(part)) {
        console.error(`Unable to parse CrUX API response from:\n${response}`);
        return null;
      }
      return JSON.parse(part.match(responseJSONPattern)[1]);
    });
  });
}
