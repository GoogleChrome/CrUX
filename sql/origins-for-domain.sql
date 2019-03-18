#standardSQL
# Gets all distinct origins for a given domain.
# Example output: http://www.example.com, http://example.com,
# https://example.com, https://www.example.com.
SELECT
  DISTINCT origin
FROM
  `chrome-ux-report.all.201801`
WHERE
  NET.REG_DOMAIN(origin) = 'example.com'