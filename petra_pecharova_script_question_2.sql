-- QUESTION 2

SELECT
	price_category_name,
	ROUND(AVG(pay_value) / AVG(avg_price_value), 2) AS avg_amount,
	price_value_unit,
	price_unit,
	price_year,
	pay_year
FROM t_petra_pecharova_project_sql_primary_final AS tpf
WHERE pay_year IN ('2006', '2018') AND price_year IN ('2006', '2018')
	AND (price_category_code = 111301 OR price_category_code = 114201)
GROUP BY price_category_name, avg_price_value, price_unit, price_year, pay_year
ORDER BY price_category_code, price_year;