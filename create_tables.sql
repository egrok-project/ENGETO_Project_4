-- Primární tabulka: mzdy + ceny potravin / Primary table: payroll + food prices
CREATE TABLE t_emil_grokhotov_project_sql_primary_final AS
SELECT 
    cp.payroll_year AS record_year,
    cp.industry_branch_code,
    cpib.name AS industry_branch,
    AVG(cp.value) AS avg_payroll_value,
    EXTRACT(YEAR FROM cpr.date_from) AS price_year,
    cpr.category_code,
    cpc.name AS category_name,
    AVG(cpr.value) AS avg_price_value,
    cpc.price_unit
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib 
    ON cp.industry_branch_code = cpib.code
JOIN czechia_price cpr 
    ON cp.payroll_year = EXTRACT(YEAR FROM cpr.date_from)
LEFT JOIN czechia_price_category cpc 
    ON cpr.category_code = cpc.code
WHERE cp.value_type_code = 5958
    AND cp.payroll_year BETWEEN 2006 AND 2018
GROUP BY 
    cp.payroll_year,
    cp.industry_branch_code,
    cpib.name,
    EXTRACT(YEAR FROM cpr.date_from),
    cpr.category_code,
    cpc.name,
    cpc.price_unit;

-- Sekundární tabulka: evropské ekonomické ukazatele / Secondary table: European economic indicators
CREATE TABLE t_emil_grokhotov_project_sql_secondary_final AS
SELECT 
    c.country,
    e.year AS record_year,
    e.gdp,
    e.gini,
    e.population
FROM countries c
JOIN economies e 
    ON c.country = e.country
WHERE c.continent = 'Europe'
    AND e.year BETWEEN 2006 AND 2018
ORDER BY c.country, e.year;