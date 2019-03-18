#standardSQL
# Gets the % of fast FCP for a given domain.
SELECT
  DISTINCT origin,
  SUM(fcp.density) AS pct_fast_fcp
FROM
  `chrome-ux-report.all.201801`,
  UNNEST(first_contentful_paint.histogram.bin) AS fcp
WHERE
  NET.REG_DOMAIN(origin) = 'example.com' AND
  fcp.start < 1000
GROUP BY
  origin