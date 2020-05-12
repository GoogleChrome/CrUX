#standardSQL
# Get the 75th percentile LCP across all countries for a single month, origin, and device.
SELECT
  country_code,
  `chrome-ux-report`.experimental.GET_COUNTRY(country_code) AS country,
  p75_lcp
FROM
  `chrome-ux-report.materialized.country_summary`
WHERE
  yyyymm = 202004 AND
  origin = 'https://web.dev' AND
  device = 'phone'
ORDER BY
  country_code
