-- -----------------------------------------------
-- 2️⃣ SELECT Query - Top 10 Countries by Cases
-- -----------------------------------------------
-- Retrieves the top 10 countries by total confirmed COVID-19 cases.
-- Handles missing or empty string values by treating them as 0 before summing.
-- Steps:
-- - CAST converts string numbers to BIGINT.
-- - CASE checks if the value is empty string and replaces it with 0.
-- - SUM aggregates the totals per country.
-- - GROUP BY groups data by country_region.
-- - ORDER BY sorts by total_cases descending.
-- - LIMIT restricts results to top 10


SELECT 
    country_region,
    SUM(
        CASE 
            WHEN confirmed = '' THEN 0 
            ELSE CAST(confirmed AS BIGINT) 
        END
    ) AS total_cases,
    SUM(
        CASE 
            WHEN deaths = '' THEN 0 
            ELSE CAST(deaths AS BIGINT) 
        END
    ) AS total_deaths
FROM covid_data
GROUP BY country_region
ORDER BY total_cases DESC
LIMIT 10;
