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

--/* Uppgift 3. Game of thrones aggregerad till en sträng

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



--*/---------------------------------------------------------------------------------------------