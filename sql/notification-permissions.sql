#standardSQL
# Explore notification permission response rates.
SELECT
  SUM(experimental.permission.notifications.accept) AS accept,
  SUM(experimental.permission.notifications.deny) AS deny,
  SUM(experimental.permission.notifications.ignore) AS `ignore`,
  SUM(experimental.permission.notifications.dismiss) AS dismiss
FROM
  `chrome-ux-report.all.202001`
WHERE
  origin = 'https://news.google.com'