-- Q4. Meziroční rozdíly v růstu cen a mezd / Yearly differences in price and wage growth
WITH WageGrowth AS (
    SELECT 
        record_year,
        AVG(avg_payroll_value) AS average_wage,
        LAG(AVG(avg_payroll_value)) OVER (ORDER BY record_year) AS previous_year_wage
    FROM t_emil_grokhotov_project_sql_primary_final
    WHERE avg_payroll_value IS NOT NULL
    GROUP BY record_year
),
PriceGrowth AS (
    SELECT 
        record_year,
        AVG(avg_price_value) AS average_food_price,
        LAG(AVG(avg_price_value)) OVER (ORDER BY record_year) AS previous_year_price
    FROM t_emil_grokhotov_project_sql_primary_final
    WHERE avg_price_value IS NOT NULL
    GROUP BY record_year
),
CombinedGrowth AS (
    SELECT 
        w.record_year AS "Rok",
        CAST(
            ((w.average_wage - w.previous_year_wage) / w.previous_year_wage * 100) 
            AS DECIMAL(10,2)
        ) AS "Růst mezd (%)",
        CAST(
            ((p.average_food_price - p.previous_year_price) / p.previous_year_price * 100) 
            AS DECIMAL(10,2)
        ) AS "Růst cen potravin (%)",
        CAST(
            ((p.average_food_price - p.previous_year_price) / p.previous_year_price * 100) - 
            ((w.average_wage - w.previous_year_wage) / w.previous_year_wage * 100) 
            AS DECIMAL(10,2)
        ) AS "Rozdíl růstu (%)"
    FROM WageGrowth w
    JOIN PriceGrowth p 
        ON w.record_year = p.record_year
    WHERE w.previous_year_wage IS NOT NULL 
        AND p.previous_year_price IS NOT NULL
)
SELECT 
    "Rok",
    "Růst mezd (%)",
    "Růst cen potravin (%)", 
    "Rozdíl růstu (%)",
    CASE 
        WHEN "Rozdíl růstu (%)" > 10 THEN 'ANO - rozdíl větší než 10 %'
        ELSE 'NE'
    END AS "Ceny rostly rychleji o více než 10 %?"
FROM CombinedGrowth
ORDER BY "Rok";