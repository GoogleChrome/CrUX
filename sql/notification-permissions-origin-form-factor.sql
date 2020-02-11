#standardSQL
# Notification permission response rates for multiple origins and form factors.
SELECT
  origin,
  form_factor,
  ROUND(accept / total, 4) AS accept,
  ROUND(deny / total, 4) AS deny,
  ROUND(`ignore` / total, 4) AS `ignore`,
  ROUND(dismiss / total, 4) AS dismiss
FROM (
  SELECT
    origin,
    form_factor.name AS form_factor,
    SUM(experimental.permission.notifications.accept) AS accept,
    SUM(experimental.permission.notifications.deny) AS deny,
    SUM(experimental.permission.notifications.ignore) AS `ignore`,
    SUM(experimental.permission.notifications.dismiss) AS dismiss,
    SUM(experimental.permission.notifications.accept +
        experimental.permission.notifications.deny +
        experimental.permission.notifications.ignore +
        experimental.permission.notifications.dismiss) AS total
  FROM
    `chrome-ux-report.all.202001`
  WHERE
    origin IN ('https://mobile.twitter.com', 'https://twitter.com') AND
    experimental.permission.notifications IS NOT NULL
  GROUP BY
    origin,
    form_factor)