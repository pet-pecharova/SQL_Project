-- QUESTION 5

WITH t_pay_growth AS (
	SELECT
		ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth,
		tpf.pay_year AS pay_year,
		ROUND(AVG(tpf.pay_value), 2) AS avg_pay,
		tpf2.pay_year AS previous_pay_year,
		ROUND(AVG(tpf2.pay_value), 2) AS avg_previous_pay
	FROM t_petra_pecharova_project_sql_primary_final AS tpf
	JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
		ON tpf.pay_year = tpf2.pay_year + 1
	GROUP BY tpf.pay_year, tpf2.pay_year
	ORDER BY tpf.pay_year DESC
),
t_price_growth AS (
	SELECT
		ROUND((AVG(tpf.avg_price_value) - AVG(tpf2.avg_price_value)) / AVG(tpf2.avg_price_value) * 100, 2) AS price_growth,
		tpf.price_year AS price_year,
		ROUND(AVG(tpf.avg_price_value), 2) AS avg_price,
		tpf2.price_year AS previous_price_year,
		ROUND(AVG(tpf2.avg_price_value), 2) AS avg_previous_price
	FROM t_petra_pecharova_project_sql_primary_final AS tpf
	JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
		ON tpf.price_year = tpf2.price_year + 1
	GROUP BY tpf.price_year, tpf2.price_year
	ORDER BY tpf.price_year DESC
),
t_GDP_growth AS (
SELECT
	ROUND((tsf.GDP - tsf2.GDP) / tsf2.GDP * 100, 2) AS GDP_growth,
	tsf.country AS eu_country,
	tsf.`year` AS GDP_year,
	tsf.GDP AS GDP_value,
	tsf2.`year` AS previous_GDP_year,
	tsf2.GDP AS previous_GDP_value
FROM t_petra_pecharova_project_sql_secondary_final AS tsf
JOIN t_petra_pecharova_project_sql_secondary_final AS tsf2
	ON tsf.`year` = tsf2.`year` + 1
WHERE tsf.country = 'Czech Republic'
	AND tsf2.country = 'Czech Republic'
ORDER BY tsf.`year` DESC
)
SELECT
	t_GDP_growth.GDP_year AS 'year',
	t_GDP_growth.GDP_growth,
	t_pay_growth.pay_growth,
	t_price_growth.price_growth
FROM t_GDP_growth
JOIN t_pay_growth
	ON t_GDP_growth.GDP_year = t_pay_growth.pay_year
JOIN t_price_growth
	ON t_gdp_growth.GDP_year = t_price_growth.price_year
ORDER BY t_GDP_growth.GDP_year DESC;