CREATE OR REPLACE TABLE t_petra_pecharova_project_SQL_primary_final AS 
	SELECT
		cp.category_code AS price_category_code,
		cpc.name AS price_category_name,
		ROUND(AVG(cp.value), 2) AS avg_price_value,
		cpc.price_value AS price_value_unit,
		cpc.price_unit AS price_unit,
		YEAR(cp.date_from) AS price_year,
		cp2.id AS pay_id,
		cp2.payroll_year AS pay_year,
		cp2.payroll_quarter AS pay_quarter,
		cp2.value AS pay_value,
		cp2.value_type_code AS pay_value_type_code,
		cpvt.name AS pay_value_type_name,
		cp2.industry_branch_code AS industry_branch_code,
		cpib.name AS industry_branch_name
	FROM czechia_price AS cp
	JOIN czechia_payroll AS cp2
		ON YEAR(cp.date_from) = cp2.payroll_year
		AND cp2.value_type_code = 5958
	JOIN czechia_payroll_industry_branch AS cpib
		ON cp2.industry_branch_code = cpib.code
	JOIN czechia_payroll_value_type AS cpvt
		ON cp2.value_type_code = cpvt.code
	JOIN czechia_price_category AS cpc
		ON cp.category_code = cpc.code
	GROUP BY cp.category_code, cpc.name, cpc.price_value, cpc.price_unit, YEAR(cp.date_from), 
	cp2.id, cp2.payroll_year, cp2.payroll_quarter, cp2.value, cp2.value_type_code, 
	cpvt.name, cp2.industry_branch_code, cpib.name
	ORDER BY cp2.payroll_year;