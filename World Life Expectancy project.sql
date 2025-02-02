# World Life Expectancy Project (Exploratory Data Analysis)

SELECT *
FROM world_life_expectancy_backup;

SELECT country, 
MIN(`Life expectancy`) as Max_expectancy,
MAX(`Life expectancy`) as Min_expectancy,
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS Increase_in_15_Years
FROM world_life_expectancy_backup
GROUP BY country
HAVING Max_expectancy <> 0
AND Min_expectancy <> 0
ORDER BY Increase_in_15_Years DESC ;

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy_backup
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;


SELECT *
FROM world_life_expectancy_backup;

SELECT country, ROUND(AVG(`Life expectancy`),1) AS Avg_life_exp, ROUND(AVG(GDP),1) AS Avg_GDP
FROM world_life_expectancy_backup
GROUP BY country
HAVING Avg_life_exp > 0 AND
Avg_GDP > 0
ORDER BY Avg_GDP DESC;


SELECT
SUM( CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) AS High_GDP_Life_Expectancy,
SUM( CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) AS Low_GDP_Life_Expectancy
FROM world_life_expectancy_backup
;


SELECT
SUM( CASE WHEN GDP >= 1200 THEN 1 ELSE 0 END) AS High_GDP_Count,
AVG(CASE WHEN GDP >= 1200 THEN `Life expectancy` ELSE NULL END) AS High_GDP_Life_Expectancy,
SUM( CASE WHEN GDP <= 1200 THEN 1 ELSE 0 END) AS Low_GDP_Count,
AVG(CASE WHEN GDP <= 1200 THEN `Life expectancy` ELSE NULL END) AS Low_GDP_Life_Expectancy
FROM world_life_expectancy_backup
;

SELECT Status, COUNT(DISTINCT(Country)), ROUND(AVG(`Life expectancy`),1) 
FROM world_life_expectancy_backup
GROUP BY Status;


SELECT country, ROUND(AVG(`Life expectancy`),1) AS Avg_life_exp, ROUND(AVG(BMI),1) AS Avg_BMI
FROM world_life_expectancy_backup
GROUP BY country
HAVING Avg_life_exp > 0 AND
Avg_BMI > 0
ORDER BY Avg_BMI DESC;


SELECT Country, 
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy_backup;


