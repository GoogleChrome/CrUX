#standardSQL
# Breaks down the global distribution of effective connection types.
# eg: 90% 4G, 9% 3G, etc.
SELECT
 effective_connection_type.name AS ect,
 ROUND(SUM(fcp.density) / (SELECT COUNT(DISTINCT origin) FROM `chrome-ux-report.all.201802`), 4) AS density
FROM
 `chrome-ux-report.all.201802`,
 UNNEST(first_contentful_paint.histogram.bin) AS fcp
GROUP BY
 ect
ORDER BY
 density DESC
