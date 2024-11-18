USE everyloop



--/* Uppgift 1

-- Format är bara möjligt i T-SQL.
SELECT
    Title,
    'S' + right('00' + cast(Season AS NVARCHAR), 2) +
    'E' + right('00' + cast(EpisodeInSeason AS NVARCHAR), 2) AS Episode,
    'S' + Format(Season, '00') + 'E' + Format(EpisodeInSeason, '00') AS Episode2
FROM GameOfThrones;

--*/------------------------------------------------------------------------------



--/* Uppgift 2

SELECT * INTO UsersCopy FROM Users;
SELECT * FROM UsersCopy;

UPDATE UsersCopy
SET UserName = LOWER(LEFT(FirstName, 2) + LEFT(LastName, 2));

SELECT * FROM UsersCopy;
DROP TABLE UsersCopy;

--*/------------------------------------------------------------------------------



--/* Uppgift 3

SELECT * INTO AirportsCopy FROM Airports

UPDATE AirportsCopy
SET Time = '-' WHERE Time IS NULL 

UPDATE AirportsCopy
SET DST = '-' WHERE DST IS NULL

SELECT COUNT(Time) AS 'Count null in Time' FROM AirportsCopy WHERE Time IS NULL

DROP TABLE AirportsCopy

--*/------------------------------------------------------------------------



--/* Uppgift 4

SELECT * INTO ElementsCopy FROM Elements

DELETE FROM ElementsCopy
WHERE
    Name = 'Erbium' OR 
    Name = 'Helium' OR 
    Name = 'Nitrogen' OR 
    Name = 'Platinum' OR 
    Name = 'Selenium' OR
    Name LIKE '[dkmou]%'

SELECT * FROM ElementsCopy ORDER BY NAME

DROP TABLE ElementsCopy

--*/----------------------------------------------------------------------



--/* Uppgift 5

SELECT
    Symbol,
    Name,
    CASE
        WHEN LEFT(Name, 2) LIKE LEFT(Symbol, 2) THEN 'yes'
        ELSE 'no'
    END AS 'Yes/No'
INTO ElementsCopy FROM Elements

SELECT * FROM ElementsCopy ORDER BY NAME

DROP TABLE ElementsCopy

--*/----------------------------------------------------------------------

--/* Uppgift 6

SELECT * INTO ColorsCopy FROM Colors

SELECT
    Name,
    '#' +
    UPPER(FORMAT(Red, 'x2') +
          FORMAT(Green, 'x2') +
          FORMAT(Blue, 'x2'))
        AS 'MyCode'
FROM ColorsCopy

DROP TABLE ColorsCopy

--*/----------------------------------------------------------------------

SELECT * FROM Types

SELECT Integer, String INTO #TypesCopy FROM Types

SELECT
    Integer,
    CAST(Integer AS FLOAT) / 100 AS 'Float',
    String,
    CAST('2019-01-' + FORMAT(Integer, '00') +
    ' 09:' + FORMAT(Integer, '00') AS DATETIME2) AS 'DateTime',
    Integer % 2 AS 'Bool'
FROM #TypesCopy

DROP TABLE #TypesCopy