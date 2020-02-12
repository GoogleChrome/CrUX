#standardSQL
# Approximates the 75th percentile FCP for origins over time.
# Warning!! This query processes the entire dataset and is 1+ TB!
SELECT
  yyyymm,
  origin,
  MIN(start) AS fcp
FROM (
  SELECT
    _TABLE_SUFFIX AS yyyymm,
    origin,
    fcp.start as start,
    fcp.density AS density,
    SUM(fcp.density) OVER (PARTITION BY _TABLE_SUFFIX, origin ORDER BY fcp.start) / SUM(fcp.density) OVER (PARTITION BY _TABLE_SUFFIX, origin) AS total
  FROM
    `chrome-ux-report.all.*`,
    UNNEST(first_contentful_paint.histogram.bin) AS fcp
  WHERE
    origin IN (
      # Comma-separated list of origins
      'https://www.example.com'
    )
    # Optionally filter by form factor
    # AND form_factor.name = 'phone'
    )
WHERE
  # 0.75 = 75th percentile
  total >= 0.75
GROUP BY
  yyyymm,
  origin
ORDER BY
  yyyymm,
  origin
