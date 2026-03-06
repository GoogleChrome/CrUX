# Query the Core Web Vitals for an origin.
# This query only consumes 43 MB! :)
SELECT
  # Largest Contentful Paint
  # good < 2500ms, poor >= 4000ms
  p75_lcp,
  fast_lcp AS good_lcp,
  avg_lcp AS needs_improvement_lcp,
  slow_lcp AS poor_lcp,
  # Interaction to Next Paint
  # good < 200ms, poor >= 500ms
  p75_inp,
  fast_inp AS good_inp,
  avg_inp AS needs_improvement_inp,
  slow_inp AS poor_inp,
  # Cumulative Layout Shift
  # good < 0.10, poor >= 0.25
  p75_cls,
  small_cls AS good_cls,
  medium_cls AS needs_improvement_cls,
  large_cls AS poor_cls
FROM
  `chrome-ux-report.materialized.metrics_summary`
WHERE
  # metrics_summary is partitioned by date, YYYY-MM-01.
  date = '2025-03-01' AND
  origin = 'https://web.dev'
