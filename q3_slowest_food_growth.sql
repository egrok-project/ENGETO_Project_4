-- Q3. Jaké kategorie potravin vykazují nejpomalejší růst cen v průměru za posledních 10 let? / Which food categories show the slowest average price growth over the last 10 years?
WITH PriceChanges AS (
    SELECT 
        category_name,
        record_year,
        AVG(avg_price_value) AS average_price,
        LAG(AVG(avg_price_value)) OVER (
            PARTITION BY category_name 
            ORDER BY record_year
        ) AS previous_year_price
    FROM t_emil_grokhotov_project_sql_primary_final
    WHERE avg_price_value IS NOT NULL 
        AND category_name IS NOT NULL
    GROUP BY category_name, record_year
),
GrowthCalculation AS (
    SELECT 
        category_name,
        record_year,
        average_price,
        previous_year_price,
        CASE 
            WHEN previous_year_price IS NOT NULL AND previous_year_price > 0
                THEN CAST(
                    ((average_price - previous_year_price) / previous_year_price * 100) 
                    AS DECIMAL(10,2)
                )
            ELSE NULL
        END AS yearly_growth_percent
    FROM PriceChanges
),
CategoryStats AS (
    SELECT 
        category_name AS "Kategorie potravin",
        COUNT(yearly_growth_percent) AS "Počet let s daty",
        CAST(AVG(yearly_growth_percent) AS DECIMAL(10,2)) AS "Průměrný roční růst (%)",
        CAST(MIN(yearly_growth_percent) AS DECIMAL(10,2)) AS "Minimální růst (%)",
        CAST(MAX(yearly_growth_percent) AS DECIMAL(10,2)) AS "Maximální růst (%)"
    FROM GrowthCalculation
    WHERE yearly_growth_percent IS NOT NULL
    GROUP BY category_name
    HAVING COUNT(yearly_growth_percent) >= 5 -- 5 let s daty pro spolehlivost
)
SELECT *
FROM CategoryStats
ORDER BY "Průměrný roční růst (%)" ASC
LIMIT 10;