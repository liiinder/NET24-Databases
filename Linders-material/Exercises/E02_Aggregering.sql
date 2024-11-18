USE everyloop

SET ANSI_WARNINGS OFF

--/* Uppgift 1. Elements

SELECT
    Period,
    min(Number) AS 'From',
    max(Number) AS 'To',
    -- Om man räknar avg isotopes utan Null
    isnull(FORMAT(
        (SUM(CAST(Stableisotopes AS FLOAT)) / COUNT(Period)
    ), 'F2'), '-') AS 'Average Isotopes', 
    -- Om man räknar avg isotopes med Null
    FORMAT(AVG(CAST(Stableisotopes AS FLOAT)), 'f2') AS 'Average Isotopes med null', 
    string_agg(Symbol, ', ') AS 'Symbols'
FROM Elements
GROUP BY
    Period

SELECT * FROM Elements

--*/---------------------------------------------------------------------------------------------



--/* Uppgift 2. Städer med minst två kunder

SELECT
    Region,
    Country,
    City,
    COUNT(Id) AS 'Customers'
FROM company.customers
GROUP BY
    Region, Country, City
HAVING COUNT(Id) > 1
ORDER BY
    'Customers' DESC

--*/---------------------------------------------------------------------------------------------



--/* Uppgift 3. Game of thrones aggregerad till en sträng

DECLARE @GameOfThrones nvarchar(max) = ''

 --SELECT * FROM GameOfThrones

SELECT
    @GameOfThrones +=
        'Säsong ' + CAST(Season AS nvarchar(MAX)) + ' sändes' +
        ' från ' + FORMAT(min([Original air date]), 'MMMM', 'sv') +
        ' till ' + FORMAT(max([Original air date]), 'MMMM', 'sv') +
        '. Totalt sändes ' + CAST(max(EpisodeInSeason) AS nvarchar(max)) +
        ' avsnitt, som i genomsnitt sågs av ' +	CAST(SUM([U.S. viewers(millions)]) AS nvarchar(MAX)) +
        'miljoner människor i USA.' + char(13)
FROM GameOfThrones
GROUP BY Season

PRINT @GameOfThrones

--*/---------------------------------------------------------------------------------------------



--/* Uppgift 4. Namn, ålder, kön

SELECT
    FirstName + ' ' + LastName AS 'Namn',
    CAST(DATEDIFF(Year,
        FORMAT(
            CAST(('19' + LEFT(ID, 6)) AS datetime2)
            , 'yyyyMMdd'
        ), GETDATE()
    ) AS nvarchar(10)) + ' år' AS 'Ålder',
    CASE
        WHEN SUBSTRING(ID, 10, 1) % 2 = 1 THEN 'Man'
        ELSE 'Kvinna'
    END AS 'Kön'
FROM Users
ORDER BY FirstName, LastName

--*/---------------------------------------------------------------------------------------------



--/* Uppgift 5. Sammanställ data för olika regioner

SELECT
    Region AS 'Namn',
    COUNT(Country) AS 'Antal länder',
    SUM(CAST([Population] AS BIGINT)) AS 'Invånare',
    SUM(CAST([Area (sq# mi#)] AS BIGINT)) AS 'Area',
    FORMAT(
        SUM(CAST([Population] AS FLOAT)) /
        SUM(CAST([Area (sq# mi#)] AS FLOAT)),
        'f2') AS 'Befolkningstäthet',
-- Förmodligen är nedanstående fel statistiskt. (pga flera avrundningar?)
    FORMAT(SUM(CAST(REPLACE(ISNULL([Infant mortality (per 1000 births)], 0), ',', '.') AS FLOAT)) / COUNT(Country) / 10, 'f0') AS 'Spädbarnsdödlighet'
FROM Countries
GROUP BY Region

SELECT * FROM Countries

--*/---------------------------------------------------------------------------------------------



--/* Uppgift 6. Gruppera per land

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'AirportsCopy')
   DROP TABLE [dbo].AirportsCopy;
GO

SELECT * INTO AirportsCopy FROM Airports

ALTER TABLE AirportsCopy ADD Country NVARCHAR(max)

-- Set Country to [Location served] but deletes all numbers
UPDATE AirportsCopy SET Country = REPLACE(TRANSLATE([Location served], '1234567890', '??????????'), '?', '')

-- Replace "Territory of" with "?" / Remove both ', Kingdom of the Netherlands'
UPDATE AirportsCopy SET Country = (
CASE
    WHEN Country LIKE '%Territoryof%' THEN REPLACE(Country, 'Territoryof', 'of?')
    WHEN Country LIKE '%Territory%of%' THEN REPLACE(Country, 'Territory of', 'of?')
    WHEN Country LIKE '%, Kingdom of the Netherlands' THEN REPLACE(Country, ', Kingdom of the Netherlands', '')
    ELSE Country
END)

-- Remove all characters until ? and one more character
-- If there is no ',' in Country save AS is.
-- Otherwise split on the last ','
UPDATE AirportsCopy SET Country = (
CASE
    WHEN Country LIKE '%of?%' THEN REVERSE(LEFT(REVERSE(Country), CHARINDEX('?', REVERSE(Country))-2))
    WHEN CHARINDEX(',', Country) = 0 THEN Country
    ELSE REVERSE(LEFT(REVERSE(Country), CHARINDEX(',', REVERSE(Country))-2))
END)

-- Hardcoded edgecases cause I couldn't bother.
UPDATE AirportsCopy SET Country = 'Australia' WHERE IATA = 'CKW'
UPDATE AirportsCopy SET Country = 'United States' WHERE IATA = 'KKK'

SELECT
    Country AS 'Land',
    COUNT(IATA) AS 'Antal flygplatser',
    COUNT(IATA) - COUNT(ICAO) AS 'Antal som saknar ICAO',
    FORMAT((CAST(COUNT(ICAO) AS FLOAT) / COUNT(IATA)), 'P1') AS 'Procent som saknar ICAO'
FROM AirportsCopy
GROUP BY Country
ORDER BY 'Antal flygplatser' DESC

SET ANSI_WARNINGS ON

--*/---------------------------------------------------------------------------------------------