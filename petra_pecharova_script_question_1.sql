-- QUESTION 1:

SELECT
	tpf.industry_branch_code,
	tpf.industry_branch_name,
	tpf.pay_year,
	ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
	CASE 
		WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
		ELSE 0
	END AS pay_decrease
FROM t_petra_pecharova_project_sql_primary_final AS tpf
JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
	ON tpf.pay_year = tpf2.pay_year + 1
	AND tpf.industry_branch_code = tpf2.industry_branch_code
GROUP BY tpf.industry_branch_code, tpf.pay_year
ORDER BY tpf.industry_branch_code, tpf.pay_year DESC;


/*
 * EXTRA DATA
 */ 

-- More detailed table - with wages by year:

SELECT
	tpf.industry_branch_code,
	tpf.industry_branch_name,
	CASE 
		WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
		ELSE 0
	END AS pay_decrease,
	ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
	tpf.pay_year AS pay_year,
	tpf.pay_value AS pay_value,
	tpf2.pay_year AS previous_pay_year,
	tpf2.pay_value AS previous_pay_value
FROM t_petra_pecharova_project_sql_primary_final AS tpf
JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
	ON tpf.pay_year = tpf2.pay_year + 1
	AND tpf.industry_branch_code = tpf2.industry_branch_code
GROUP BY tpf.industry_branch_code, tpf.industry_branch_name, tpf.pay_year , tpf2.pay_year, tpf.pay_value, tpf2.pay_value
ORDER BY tpf.industry_branch_code, tpf.pay_year DESC;



-- Total average growth 
WITH t_avg_growth AS (
SELECT
	tpf.industry_branch_code,
	tpf.industry_branch_name,
	tpf.pay_year,
	ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
	CASE 
		WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
		ELSE 0
	END AS pay_decrease
FROM t_petra_pecharova_project_sql_primary_final AS tpf
JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
	ON tpf.pay_year = tpf2.pay_year + 1
	AND tpf.industry_branch_code = tpf2.industry_branch_code
GROUP BY tpf.industry_branch_code, tpf.pay_year
ORDER BY tpf.industry_branch_code, tpf.pay_year DESC
)
SELECT
	ROUND(AVG(t_avg_growth.pay_growth_percent), 2) AS avg_total_growth
FROM t_avg_growth;



-- Average growth by category

WITH t_avg_growth AS (
SELECT
	tpf.industry_branch_code,
	tpf.industry_branch_name,
	tpf.pay_year,
	ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
	CASE 
		WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
		ELSE 0
	END AS pay_decrease
FROM t_petra_pecharova_project_sql_primary_final AS tpf
JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
	ON tpf.pay_year = tpf2.pay_year + 1
	AND tpf.industry_branch_code = tpf2.industry_branch_code
GROUP BY tpf.industry_branch_code, tpf.pay_year
ORDER BY tpf.industry_branch_code, tpf.pay_year DESC
)
SELECT
	t_avg_growth.industry_branch_code,
	t_avg_growth.industry_branch_name,
	ROUND(AVG(t_avg_growth.pay_growth_percent), 2) AS avg_total_growth
FROM t_avg_growth
GROUP BY t_avg_growth.industry_branch_code, t_avg_growth.industry_branch_name
ORDER BY avg_total_growth;



-- Total number of years when wages decreased - by category:

WITH t_decrease AS (
	SELECT
		tpf.industry_branch_code AS industry_branch_code,
		tpf.industry_branch_name AS industry_branch_name,
		tpf.pay_year,
		ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
		CASE 
			WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
			ELSE 0
		END AS pay_decrease
	FROM t_petra_pecharova_project_sql_primary_final AS tpf
	JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
		ON tpf.pay_year = tpf2.pay_year + 1
		AND tpf.industry_branch_code = tpf2.industry_branch_code
	GROUP BY tpf.industry_branch_code, tpf.pay_year
	ORDER BY tpf.industry_branch_code, tpf.pay_year DESC
)
SELECT
	t_decrease.industry_branch_code,
	t_decrease.industry_branch_name,
	SUM(t_decrease.pay_decrease)
FROM t_decrease
GROUP BY t_decrease.industry_branch_code, t_decrease.industry_branch_name;



-- Categories where decrease was recorded
SELECT
	tpf.industry_branch_code,
	tpf.industry_branch_name,
	tpf.pay_year,
	ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent
FROM t_petra_pecharova_project_sql_primary_final AS tpf
JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
	ON tpf.pay_year = tpf2.pay_year + 1
	AND tpf.industry_branch_code = tpf2.industry_branch_code
GROUP BY tpf.industry_branch_code, tpf.industry_branch_name, tpf.pay_year
HAVING ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0
ORDER BY tpf.industry_branch_code, tpf.pay_year DESC;



-- Decrease in 2013
SELECT
	tpf.industry_branch_code,
	tpf.industry_branch_name,
	tpf.pay_year,
	ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
	CASE 
		WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
		ELSE 0
	END AS pay_decrease
FROM t_petra_pecharova_project_sql_primary_final AS tpf
JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
	ON tpf.pay_year = tpf2.pay_year + 1
	AND tpf.industry_branch_code = tpf2.industry_branch_code
WHERE tpf.pay_year = 2013
GROUP BY tpf.industry_branch_code, tpf.pay_year
HAVING ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0
ORDER BY tpf.industry_branch_code, tpf.pay_year DESC;



-- Categories with constant growth

WITH t_decrease AS (
	SELECT
		tpf.industry_branch_code AS industry_branch_code,
		tpf.industry_branch_name AS industry_branch_name,
		tpf.pay_year,
		ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) AS pay_growth_percent,
		CASE 
			WHEN ROUND((AVG(tpf.pay_value) - AVG(tpf2.pay_value)) / AVG(tpf2.pay_value) * 100, 2) < 0 THEN 1
			ELSE 0
		END AS pay_decrease
	FROM t_petra_pecharova_project_sql_primary_final AS tpf
	JOIN t_petra_pecharova_project_sql_primary_final AS tpf2
		ON tpf.pay_year = tpf2.pay_year + 1
		AND tpf.industry_branch_code = tpf2.industry_branch_code
	GROUP BY tpf.industry_branch_code, tpf.pay_year
	ORDER BY tpf.industry_branch_code, tpf.pay_year DESC
)
SELECT
	t_decrease.industry_branch_code,
	t_decrease.industry_branch_name,
	SUM(t_decrease.pay_decrease)
FROM t_decrease
GROUP BY t_decrease.industry_branch_code, t_decrease.industry_branch_name
HAVING SUM(t_decrease.pay_decrease) = 0;

