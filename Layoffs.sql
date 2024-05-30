
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
    strftime('%Y', date), Country;
	
----------------------------------------------
-- List of total layoffs per country
SELECT 
    Country,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
GROUP BY 
    Country;
	
----------------------------------------------
-- List of total layoffs per Industry
SELECT 
    Industry,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
WHERE 
    Laid_Off_Count IS NOT NULL
GROUP BY 
    Industry
ORDER BY 
    Total_Layoffs ASC;
	
----------------------------------------------
-- Top 5 countries with the highest total layoffs
SELECT 
    Country,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
WHERE 
    Laid_Off_Count IS NOT NULL
GROUP BY 
    Country
ORDER BY 
    Total_Layoffs DESC
LIMIT 5;

----------------------------------------------
-- Retrieve total layoffs per company:
SELECT 
    Company,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
WHERE 
    Laid_Off_Count IS NOT NULL
GROUP BY 
    Company
ORDER BY 
    Total_Layoffs DESC;

----------------------------------------------
-- Retrieve layoffs by date range:
SELECT 
    Date,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
WHERE 
    Date BETWEEN 'start_date' AND 'end_date';

----------------------------------------------
-- Retrieve layoffs by stage of company:
SELECT 
    Stage,
    SUM(Laid_Off_Count) AS Total_Layoffs
FROM 
    Layoffs_Data..Layoffs
GROUP BY 
    Stage;

----------------------------------------------
-- Retrieve monthly layoffs by country
SELECT 
    Country,
    strftime('%Y-%m', Date) AS Month,
    SUM(Laid_Off_Count) AS Monthly_Layoffs
FROM 
    Layoffs_Data..Layoffs
WHERE 
    Laid_Off_Count IS NOT NULL
GROUP BY 
    Country, Month
ORDER BY 
    Country, Month;

