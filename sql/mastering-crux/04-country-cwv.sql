# Core Web Vitals performance by country.
SELECT
  yyyymm,
  `chrome-ux-report`.experimental.GET_COUNTRY(country_code) AS country,
  device,
  fast_lcp / (fast_lcp + avg_lcp + slow_lcp) AS pct_good_lcp,
  p75_lcp,
  fast_fid / (fast_fid + avg_fid + slow_fid) AS pct_good_fid,
  p75_fid,
  small_cls / (small_cls + medium_cls + large_cls) AS pct_good_cls,
  p75_cls
FROM
  `chrome-ux-report.materialized.country_summary`
WHERE
  yyyymm >= 202001 AND
  country_code IN ('kr', 'ng') AND
  origin = 'https://web.dev' AND
  device IN ('desktop')
ORDER BY
  yyyymm DESC,
  country
