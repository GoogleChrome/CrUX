#standardSQL
SELECT
  MIN(start) AS p90_fcp
FROM (
  SELECT
      bin.start as start,
      bin.density AS density,
      (SUM(bin.density) OVER (ORDER BY bin.start))/(SUM(bin.density) OVER ()) AS total
  FROM
    `chrome-ux-report.country_us.201901`,
    UNNEST(first_contentful_paint.histogram.bin) AS bin
  WHERE
    origin = 'https://www.example.com'
    and effective_connection_type.name= '4G'
    and form_factor.name != 'desktop')
WHERE
  total >= 0.9
