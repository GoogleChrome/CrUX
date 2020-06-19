# Querying one month of Core Web Vitals stats for an origin.
SELECT
  fast_lcp AS pct_good_lcp,
  p75_lcp,
  fast_fid AS pct_good_fid,
  p75_fid,
  small_cls AS pct_good_cls,
  p75_cls
FROM
  `chrome-ux-report.materialized.metrics_summary`
WHERE
  date = '2020-04-01' AND
  origin = 'https://web.dev'
