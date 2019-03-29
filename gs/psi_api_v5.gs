// Example of Google Apps Script code that connects a Sheet with the PSI v5 API.

var scriptProperties = PropertiesService.getScriptProperties();
var pageSpeedApiKey = scriptProperties.getProperty('PSI_API_KEY');
var pageSpeedMonitorUrls = [
  'https://www.nytimes.com',
  'https://www.washingtonpost.com'
];

function monitor() {
  for (var i = 0; i < pageSpeedMonitorUrls.length; i++) {
    var url = pageSpeedMonitorUrls[i];
    var desktop = callPageSpeed(url, 'desktop');
    var mobile = callPageSpeed(url, 'mobile');
    addRow(url, desktop, mobile);
  }
}

function callPageSpeed(url, strategy) {
  var pageSpeedUrl = 'https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=' + url + '&fields=originLoadingExperience&key=' + pageSpeedApiKey + '&strategy=' + strategy;
  var response = UrlFetchApp.fetch(pageSpeedUrl);
  var json = response.getContentText();
  return JSON.parse(json);
}

function addRow(url, desktop, mobile) {
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var date = Utilities.formatDate(new Date(), 'GMT', 'yyyy-MM-dd');
  var sheet = spreadsheet.getSheetByName('Desktop');
  sheet.appendRow([
    date,
    url,
    getFastFCP(desktop),
    getFastFID(desktop)
  ]);
  sheet = spreadsheet.getSheetByName('Mobile');
  sheet.appendRow([
    date,
    url,
    getFastFCP(mobile),
    getFastFID(mobile)
  ]);
}

function getFastFCP(data) {
  return data.originLoadingExperience.metrics.FIRST_CONTENTFUL_PAINT_MS.distributions[0].proportion;
}

function getFastFID(data) {
  return data.originLoadingExperience.metrics.FIRST_INPUT_DELAY_MS.distributions[0].proportion;
}
