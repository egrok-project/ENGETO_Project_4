-- Q5. Vliv HDP na mzdy a ceny / GDP impact on wages and prices.
WITH CzechData AS (
    SELECT 
        s.record_year,
        s.gdp,
        LAG(s.gdp) OVER (ORDER BY s.record_year) AS previous_gdp,
        (
            SELECT AVG(avg_payroll_value) 
            FROM t_emil_grokhotov_project_sql_primary_final 
            WHERE record_year = s.record_year 
                AND avg_payroll_value IS NOT NULL
        ) AS average_wage,
        (
            SELECT AVG(avg_price_value) 
            FROM t_emil_grokhotov_project_sql_primary_final 
            WHERE record_year = s.record_year 
                AND avg_price_value IS NOT NULL
        ) AS average_price
    FROM t_emil_grokhotov_project_sql_secondary_final s
    WHERE s.country = 'Czech Republic'
        AND s.record_year BETWEEN 2006 AND 2018
),
GrowthCalculation AS (
    SELECT 
        record_year AS "Rok",
        CAST(
            ((gdp - previous_gdp) / previous_gdp * 100) 
            AS DECIMAL(10,2)
        ) AS "Růst HDP (%)",
        CAST(
            ((average_wage - LAG(average_wage) OVER (ORDER BY record_year)) / 
            LAG(average_wage) OVER (ORDER BY record_year) * 100) 
            AS DECIMAL(10,2)
        ) AS "Růst mezd (%)",
        CAST(
            ((average_price - LAG(average_price) OVER (ORDER BY record_year)) / 
            LAG(average_price) OVER (ORDER BY record_year) * 100) 
            AS DECIMAL(10,2)
        ) AS "Růst cen potravin (%)"
    FROM CzechData
)
SELECT 
    "Rok",
    "Růst HDP (%)",
    "Růst mezd (%)",
    "Růst cen potravin (%)",
    CASE 
        WHEN "Růst HDP (%)" > 3 AND "Růst mezd (%)" > 3 THEN 'Silná korelace'
        WHEN "Růst HDP (%)" < 0 AND "Růst mezd (%)" < 1 THEN 'Recesní efekt'
        ELSE 'Slabá korelace'
    END AS "Vztah HDP a mezd",
    CASE 
        WHEN "Růst HDP (%)" > 3 AND "Růst cen potravin (%)" > 3 THEN 'Inflační'
        ELSE 'Normální'
    END AS "Vztah HDP a cen"
FROM GrowthCalculation
WHERE "Růst HDP (%)" IS NOT NULL 
    AND "Růst mezd (%)" IS NOT NULL 
    AND "Růst cen potravin (%)" IS NOT NULL
ORDER BY "Rok";