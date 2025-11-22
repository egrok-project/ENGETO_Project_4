-- Q1. Rozbor trendů mezd podle odvětví./ Analysis of wage trends by industry.
WITH WageTrends AS (
    SELECT 
        industry_branch,
        record_year,
        AVG(avg_payroll_value) AS average_wage,
        LAG(AVG(avg_payroll_value)) OVER (
            PARTITION BY industry_branch 
            ORDER BY record_year
        ) AS previous_year_wage
    FROM t_emil_grokhotov_project_sql_primary_final
    WHERE avg_payroll_value IS NOT NULL
    GROUP BY industry_branch, record_year
),
GrowthCalculation AS (
    SELECT 
        industry_branch,
        record_year,
        average_wage,
        previous_year_wage,
        CASE 
            WHEN previous_year_wage IS NOT NULL AND previous_year_wage > 0 
                THEN ROUND(
                    ((average_wage - previous_year_wage) / previous_year_wage * 100), 
                    2
                )
            ELSE NULL
        END AS yearly_growth_percent
    FROM WageTrends
)
SELECT 
    industry_branch AS "Odvětví",
    COUNT(*) AS "Počet let s daty",
    COUNT(CASE WHEN yearly_growth_percent < 0 THEN 1 END) AS "Roky s poklesem",
    MIN(yearly_growth_percent) AS "Největší pokles (%)",
    MAX(yearly_growth_percent) AS "Největší růst (%)",
    ROUND(AVG(yearly_growth_percent), 2) AS "Průměrný růst (%)"
FROM GrowthCalculation
WHERE yearly_growth_percent IS NOT NULL
GROUP BY industry_branch
ORDER BY "Roky s poklesem" DESC, "Průměrný růst (%)" ASC;