/*

Queries used for Tableau Project

COVID-19 Deaths & Vaccinations Datasets

Data Range: 1/1/2020 - 4/30/2021

*/

-- 1. Create Table 1 consisting of total_cases, total_deaths and DeathPercentage Fields. 

SELECT 
	SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS int)) AS total_deaths, 
	SUM(CAST(new_deaths AS int))/SUM(New_Cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
WHERE continent IS NOT NULL 
--GROUP BY date
ORDER BY 1,2


-- 2. Create Table 2 consisting of location and TotalDeathCount Fields.

SELECT location, SUM(CAST(new_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
WHERE continent IS NULL AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC


-- 3. Create Table 3 consisting of Location, Population, HighestInfectionCount and PercentPopulationInfected Fields. 

SELECT 
	Location, 
	Population, MAX(total_cases) AS HighestInfectionCount,
	Max((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location like '%states%'
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC


-- 4. Location, Population, date, HighestInfectionCount, PercentPopulationInfected Fields. 

SELECT 
	Location, 
	Population,
	date,
	MAX(total_cases) AS HighestInfectionCount,  
	Max((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC












