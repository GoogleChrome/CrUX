# CrUX Cookbook

Recipes for extracting insights from the [Chrome User Experience Report](developers.google.com/web/tools/chrome-user-experience-report/) (CrUX).

## Guided Tour of CrUX

1. [Counting the number of distinct origins](https://bigquery.cloud.google.com/savedquery/920398604589:a3f1c0c2440f481b9cf7ddb082726f50)
2. [Searching for origins by their domain](https://bigquery.cloud.google.com/savedquery/920398604589:15e6809044844a638d24fdcfef2fd690)
3. [Generating First Contentful Paint (FCP) histogram data for an origin](https://bigquery.cloud.google.com/savedquery/920398604589:b7493f9a2d21445db152ee9fac8cbbde)
    - [visualizing the histogram](https://docs.google.com/spreadsheets/d/1oFpRt3dJJqHr6dMEotzIcS289wXDgXAuS6Qnn2hYCjE/edit?usp=sharing)
4. [Generating FCP histograms for each device](https://bigquery.cloud.google.com/savedquery/920398604589:3ae19b10ebfa4845bb67ce14feec0b8a)
    - [visualizing the histograms](https://docs.google.com/spreadsheets/d/1oFpRt3dJJqHr6dMEotzIcS289wXDgXAuS6Qnn2hYCjE/edit#gid=1947313197)
5. [Measuring proportion of device usage](https://bigquery.cloud.google.com/savedquery/920398604589:0d8c9393198b48d6892cc209fbc2b131)
    - [Measuring proportion of connection usage](https://bigquery.cloud.google.com/savedquery/920398604589:08a5b022fb6740aba0fc3ad818169146)
    - [Measuring proportion of device and connection usage](https://bigquery.cloud.google.com/savedquery/920398604589:da87c0f06bf8488b83735271ddbba0ef)
6. [Generating FCP histogram with normalized bin widths](https://bigquery.cloud.google.com/savedquery/920398604589:52cfec3eb5794f26833f1cb7636a764f)
    - [visualizing the histogram](https://docs.google.com/spreadsheets/d/1oFpRt3dJJqHr6dMEotzIcS289wXDgXAuS6Qnn2hYCjE/edit#gid=1214287754)


## Contributing

Pull requests welcome!

- Standard SQL preferred
- Match formatting of existing recipes ("Format Query" on BigQuery doesn't always look good)
- Name your recipe using descriptive keywords (eg `median-fcp.sql`)
- Use lots of comments whenever needed to help users understand what you're doing, why you're doing it that way, and any limitations of your approach
- Queries that consume 10+ GB must be noted in the comments
- Assign PR to @rviscomi for review
