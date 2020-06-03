# CrUX Core Web Vitals Checker

## Make an API key

In order to use this tool, you'll need an API key to access the Chrome UX Report API.

You can create a key in the Google API credentials page: https://console.developers.google.com/apis/credentials

## Call the CLI

Send query!

```sh
$ node main.js --origin "https://example.com" --key yourAPIKey
```

Get results!

```sh
Origin: https://example.com, FormFactor: ALL
Metric "cumulative_layout_shift" passes the Core Web Vitals assessment. (0.04 <= 0.1)
Metric "first_input_delay" passes the Core Web Vitals assessment. (21 <= 100)
Metric "largest_contentful_paint" passes the Core Web Vitals assessment. (2069 <= 2500)

Core Web Vitals Assessment: PASSED
```