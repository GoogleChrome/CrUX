#standardSQL
# Emulates the analysis on https://www.thinkwithgoogle.com/feature/testmysite
SELECT
  `chrome-ux-report`.experimental.PERCENTILE(ARRAY_AGG(bin), 75) AS p75_lcp
FROM
  `chrome-ux-report.experimental.country`,
  UNNEST(largest_contentful_paint.histogram.bin) AS bin
WHERE
  yyyymm = 202001 AND
  country_code = 'us' AND
  origin = 'https://www.example.com' AND
  effective_connection_type.name = '4G' AND
  form_factor.name != 'desktop'
