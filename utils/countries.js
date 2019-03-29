// The table to query for each country.
// Feeling adventurous? Use '*' to query all monthly releases.
var CRUX_MONTH = '201902';

// Given the countries.json object, transform it into SQL. For example:
// SELECT *, 'af' AS country_code, 'Afghanistan' AS country, 'Asia' AS region, 'Southern Asia' AS subregion FROM `chrome-ux-report.country_af.201902` UNION ALL
// SELECT *, 'ax' AS country_code, 'Åland Islands' AS country, 'Europe' AS region, 'Northern Europe' AS subregion FROM `chrome-ux-report.country_ax.201902` UNION AL
// ...
var countries = Object.entries(countries).map(([code, country]) => {
  return `SELECT *, '${code}' AS country_code, ` +
  // Escape country names with apostrophies.
  `'${country.name.replace(`'`, `\\'`)}' AS country, ` +
  `'${country.region || ''}' AS region, ` +
  `'${country['sub-region']}' AS subregion ` +
  `FROM \`chrome-ux-report.country_${code}.${CRUX_MONTH}\``;
}).join(' UNION ALL\n  ');

console.log(`WITH
  countries AS (
  ${countries}
)`);
