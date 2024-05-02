-- Layoffs Data from 2020-2024 
-- This dataset was scraped from Layoffs.fyi with the hope to enable Kaggle community to look into analyzing recent mass layoffs and discover useful insights and patterns.
-- Original dataset can be tracked at https://layoffs.fyi/
-- Credits: Roger Lee



-- List of countries total layoffs per year
SELECT 
    strftime('%Y', date) AS Year,
    Country,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
GROUP BY 
   strftime('%Y', date),  Country



-- List of countries total layoffs
SELECT 
    Country,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
GROUP BY 
   Country


-- List of countries total layoffs

