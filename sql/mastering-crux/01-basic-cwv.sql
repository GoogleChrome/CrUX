# Querying one month of Core Web Vitals stats for an origin.
SELECT
  fast_lcp AS pct_good_lcp,
  p75_lcp,
  fast_inp AS pct_good_inp,
  p75_inp,
  small_cls AS pct_good_cls,
  p75_cls
FROM
  `chrome-ux-report.materialized.metrics_summary`
WHERE
  date = '2025-03-01' AND
  origin = 'https://web.dev'
