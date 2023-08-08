-- QUESTION 3

WITH price_growth AS (
	SELECT
		DISTINCT tpf.price_category_code AS category_code,
		tpf.price_category_name AS category_name,
		ROUND((tpf.avg_price_value - tpf2.avg_price_value) / tpf2.avg_price_value * 100, 2) AS price_growth_percent,
		tpf.price_year AS 'year',
		tpf.avg_price_value AS price,
		tpf2.price_year AS previous_year,
		tpf2.avg_price_value AS price_previous_year
	FROM t_petra_pecharova_project_sql_primary_final AS tpf
	JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
		ON tpf.price_category_code = tpf2.price_category_code
		AND tpf.price_year = tpf2.price_year + 1
	ORDER BY tpf.price_category_code, tpf.price_year DESC
)
SELECT
	category_code,
	category_name,
	ROUND(AVG(price_growth_percent), 2) AS avg_growth
FROM price_growth
GROUP BY category_code, category_name
ORDER BY avg_growth
LIMIT 5;