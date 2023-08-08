CREATE OR REPLACE TABLE t_petra_pecharova_project_sql_secondary_final AS
	SELECT
		c.country,
		c.capital_city,
		c.region_in_world,
		e.population,
		e.`year`,
		ROUND(e.GDP, 2) AS GDP,
		e.gini,
		ROUND(e.taxes, 2) AS taxes
	FROM countries AS c
	JOIN economies AS e
		ON c.country = e.country
	WHERE c.continent = 'Europe' AND e.`year` BETWEEN 2006 AND 2018
	ORDER BY country, `year`;