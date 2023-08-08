-- QUESTION 4

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
	FROM t_primary_table AS tpf
	JOIN t_primary_table AS tpf2
		ON tpf.price_year = tpf2.price_year + 1
	GROUP BY tpf.price_year, tpf2.price_year
	ORDER BY tpf.price_year DESC
)
SELECT
	t_price_growth.price_year,
	t_price_growth.price_growth,
	CASE
		WHEN price_growth > 10 THEN 1
		ELSE 0
	END AS significantly_high_price_growth,
	t_pay_growth.pay_growth,
	t_price_growth.price_growth - t_pay_growth.pay_growth AS price_pay_difference
FROM t_price_growth
JOIN t_pay_growth
	ON t_price_growth.price_year = t_pay_growth.pay_year
ORDER BY t_price_growth.price_year DESC;