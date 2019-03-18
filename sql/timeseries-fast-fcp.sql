#standardSQL
# Gets a month-to-month sequence of % fast FCP for a given origin.
SELECT
  _TABLE_SUFFIX AS yyyymm,
  SUM(fcp.density) AS pct_fast_fcp
FROM
  `chrome-ux-report.all.*`,
  UNNEST(first_contentful_paint.histogram.bin) AS fcp
WHERE
  origin = 'http://example.com' AND
  fcp.start < 1000
GROUP BY
  yyyymm
ORDER BY
  yyyymm