#standardSQL
# Approximates the 75th percentile FCP for a given origin and form factor.
SELECT
  MIN(start) AS fcp
FROM (
  SELECT
      fcp.start as start,
      fcp.density AS density,
      SUM(fcp.density) OVER (ORDER BY fcp.start) / SUM(fcp.density) OVER () AS total
  FROM
    `chrome-ux-report.all.202001`,
    UNNEST(first_contentful_paint.histogram.bin) AS fcp
  WHERE
    origin = 'https://www.example.com' AND
    form_factor.name = 'phone')
WHERE
  # 0.75 = 75th percentile
  total >= 0.75