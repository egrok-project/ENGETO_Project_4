-- Q2. Analýza kupní síly průměrné mzdy vůči cenám základních potravin (chléb a mléko). / Analysis of purchasing power of average wage against prices of basic food items (bread and milk).
WITH FirstLastYears AS (
    SELECT 
        MIN(record_year) AS first_year,
        MAX(record_year) AS last_year
    FROM t_emil_grokhotov_project_sql_primary_final
),
AverageWages AS (
    SELECT 
        record_year,
        AVG(avg_payroll_value) AS average_wage
    FROM t_emil_grokhotov_project_sql_primary_final
    WHERE avg_payroll_value IS NOT NULL
    GROUP BY record_year
),
ProductPrices AS (
    SELECT 
        record_year,
        category_name,
        AVG(avg_price_value) AS average_price,
        price_unit
    FROM t_emil_grokhotov_project_sql_primary_final
    WHERE category_code IN (111301, 114201)  -- Bread and Milk
    GROUP BY record_year, category_name, price_unit
)
SELECT 
    p.record_year AS "Rok",
    p.category_name AS "Produkt",
    w.average_wage AS "Průměrná mzda",
    p.average_price AS "Průměrná cena",
    p.price_unit AS "Jednotka",
    CAST(w.average_wage / p.average_price AS DECIMAL(10,2)) AS "Množství za mzdu"
FROM ProductPrices p
JOIN AverageWages w 
    ON p.record_year = w.record_year
WHERE p.record_year IN (
    SELECT first_year FROM FirstLastYears
    UNION ALL
    SELECT last_year FROM FirstLastYears
)
ORDER BY p.category_name, p.record_year;