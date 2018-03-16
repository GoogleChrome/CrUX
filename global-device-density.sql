#standardSQL
# Breaks down the global distribution of form factors.
# eg: 76% phone, 23% desktop, 1% tablet.
SELECT
 form_factor.name AS device,
 ROUND(SUM(fcp.density) / (SELECT COUNT(DISTINCT origin) FROM `chrome-ux-report.all.201802`), 4) AS density
FROM
 `chrome-ux-report.all.201802`,
 UNNEST(first_contentful_paint.histogram.bin) AS fcp
GROUP BY
 device
ORDER BY
 device
