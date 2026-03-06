# Core Web Vitals performance by device.
SELECT
  yyyymm,
  device,
  fast_lcp / (fast_lcp + avg_lcp + slow_lcp) AS pct_good_lcp,
  p75_lcp,
  fast_inp / (fast_inp + avg_inp + slow_inp) AS pct_good_inp,
  p75_inp,
  small_cls / (small_cls + medium_cls + large_cls) AS pct_good_cls,
  p75_cls
FROM
  `chrome-ux-report.materialized.device_summary`
WHERE
  date >= '2025-03-01' AND
  origin = 'https://web.dev' AND
  device IN ('desktop', 'phone')
ORDER BY
  yyyymm DESC,
  device
