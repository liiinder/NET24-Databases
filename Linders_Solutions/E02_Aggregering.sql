USE everyloop

/* Uppgift 1. Elements

SELECT 
    Period,
    min(Number) as 'from',
    max(Number) as 'to',
    isnull(FORMAT(avg(cast(Stableisotopes as float)), 'F2'), '-') as 'Average Isotopes',
    string_agg(Symbol, ', ') as 'Symbols'
FROM Elements
GROUP BY
    Period

--*/---------------------------------------------------------------------------------------------

/* Uppgift 2. Städer med minst två kunder

SELECT 
    Region,
    Country,
    City,
    Count(Id) as 'Customers'
FROM company.customers
GROUP BY
    Region, Country, City
ORDER BY
    'Customers' desc

--*/---------------------------------------------------------------------------------------------

/* Uppgift 3. Game of thrones aggregerad till en sträng

DECLARE @GameOfThrones nvarchar(max) = ''

 --SELECT * FROM GameOfThrones

SELECT
	@GameOfThrones +=
    'Säsong ' + CAST(Season AS nvarchar(MAX)) + ' sändes' + 
    ' från ' + FORMAT(min([Original air date]), 'MMMM', 'sv') +
    ' till ' + FORMAT(max([Original air date]), 'MMMM', 'sv') +
    --'. Totalt sändes ' + CAST(COUNT(Episode) AS nvarchar(MAX)) + ' avsnitt, som i genomsnitt sågs av ' +
    '. Totalt sändes ' + CAST(max(EpisodeInSeason) as nvarchar(max)) + ' avsnitt, som i genomsnitt sågs av ' +
    CAST(SUM([U.S. viewers(millions)]) AS nvarchar(MAX)) + 'miljoner människor i USA.' +
	char(13)
FROM GameOfThrones
GROUP BY Season

PRINT @GameOfThrones

--*/---------------------------------------------------------------------------------------------

--/* Uppgift 4. Namn, ålder, kön
--*/---------------------------------------------------------------------------------------------

--/* Uppgift 5. Sammanställ data för olika regioner
--*/---------------------------------------------------------------------------------------------

--/* Uppgift 6. Gruppera per land
IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'AirportsCopy')  
   DROP TABLE [dbo].AirportsCopy;  
GO

SELECT * INTO AirportsCopy FROM Airports

ALTER TABLE AirportsCopy ADD Country NVARCHAR(max)

-- Removes all NON-ANSCII letters
UPDATE AirportsCopy
SET Country = (
CASE 
	WHEN [Location served] != Cast([Location served] as VARCHAR(100)) THEN Cast([Location served] as VARCHAR(100)) 
	ELSE Country
END)

-- Set Country to [Location served] but deletes all numbers
UPDATE AirportsCopy 
SET Country = REPLACE(TRANSLATE([Location served], '1234567890', '??????????'), '?', '')

-- Replace "Territory of" with "?"
UPDATE AirportsCopy
SET Country = REPLACE(Country, 'Territoryof', 'of?')
WHERE Country LIKE '%Territoryof%'

UPDATE AirportsCopy
SET Country = REPLACE(Country, 'Territory of', 'of?')
WHERE Country LIKE '%Territory%of%'

-- Replace all ', Kingdom of the Netherlands'
UPDATE AirportsCopy
SET Country = REPLACE(Country, ', Kingdom of the Netherlands', '')
WHERE Country LIKE '%, Kingdom of the Netherlands'

-- Remove all characters until ? and one more character
-- If there is no ',' in Country save as is.
-- Otherwise split on the last ','
UPDATE AirportsCopy
SET Country = (
CASE
	WHEN Country LIKE '%of?%' THEN REVERSE(LEFT(REVERSE(Country), CHARINDEX('?', REVERSE(Country))-2))
	WHEN CHARINDEX(',', Country) = 0 THEN Country
	ELSE REVERSE(LEFT(REVERSE(Country), CHARINDEX(',', REVERSE(Country))-2))
END)

-- Hardcoded edgecases cause I couldn't bother.
UPDATE AirportsCopy SET Country = 'Australia' WHERE IATA = 'CKW'
UPDATE AirportsCopy SET Country = 'United States' WHERE IATA = 'KKK'

SELECT
	Country as 'Land',
	--MIN(IATA) as 'IATA',
	COUNT(IATA) as 'Antal flygplatser',
	COUNT(IATA) - COUNT(ICAO) as 'Antal som saknar ICAO',
	FORMAT((CAST(COUNT(ICAO) as float) / COUNT(*)) * 100, 'f1') + '%' as 'Procent som saknar ICAO'
FROM AirportsCopy
GROUP BY Country
ORDER BY 'Antal flygplatser' desc

-- Experiment kod som får stå kvar för att visa tankegången för att hitta och ta bort länder med siffror i.

--SELECT
--	[Airport name],
--	[Location served],
--	IATA,
	--CASE 
	--	WHEN CHARINDEX(',', [Location served]) = 0 THEN [Location served]
	--	ELSE REVERSE(LEFT(REVERSE([Location served]), CHARINDEX(',', REVERSE([Location served]))-1))
	--END as 'Country',
	--CASE
	--	WHEN CHARINDEX(',', [Location served]) = 0 THEN [Location served]
	--	ELSE CAST(CHARINDEX(',', REVERSE([Location served])) as nvarchar(max))
	--END as 'R.Index',
	--CASE
	--	WHEN CHARINDEX(',', [Location served]) = 0 THEN [Location served]
	--	ELSE REVERSE([Location served])
	--END as 'Reverse',
	--CASE
	--WHEN CHARINDEX(',', [Location served]) = 0 THEN [Location served]
	--ELSE 
	--REVERSE(LEFT(
	--	REVERSE(REPLACE(TRANSLATE([Location served], '1234567890','??????????'), '?', '')), 
	--	CHARINDEX(',',  
	--		REVERSE(REPLACE(TRANSLATE([Location served], '1234567890','??????????'), '?', '')))-2
	--))
	--END as 'TEST'
--FROM Airports WHERE IATA IN ('YLL', 'LEJ', 'KUL', 'JRS', 'ASI', 'OFU', 'BDA')
--FROM Airports WHERE IATA = 'HLE'
--FROM Airports WHERE [Location served] LIKE '%Ascension%'
--FROM Airports WHERE [Location served] LIKE '%'

--Select * FROM Countries

--*/---------------------------------------------------------------------------------------------