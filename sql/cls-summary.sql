#standardSQL
# This query only processes 117.5 MB because it uses the materialized dataset!
SELECT
  p75_cls,
  small_cls AS good,
  medium_cls AS needs_improvement,
  large_cls AS poor
FROM
  `chrome-ux-report.materialized.metrics_summary`
WHERE
  yyyymm = 202003
  AND origin = 'https://web.dev'
