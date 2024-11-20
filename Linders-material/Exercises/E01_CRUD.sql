USE everyloop

-- Uppgifter från filen - Exercises\CRUD.md




-------------------------------------------------------------------------------------------------
--/* Uppgift 1. Game of thrones
-------------------------------------------------------------------------------------------------

SELECT
    Title,
-- Version med right (substring)
    'S' + RIGHT('00' + CAST(Season AS NVARCHAR), 2) +
    'E' + RIGHT('00' + CAST(EpisodeInSeason AS NVARCHAR), 2) AS Episode,
-- Version med Format
    'S' + FORMAT(Season, '00') + 'E' + FORMAT(EpisodeInSeason, '00') AS Episode2
FROM GameOfThrones;




--*/---------------------------------------------------------------------------------------------
--/* Uppgift 2. Uppdatera användarnamn
-------------------------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name LIKE 'UsersCopy')
   DROP TABLE [dbo].UsersCopy;
GO

SELECT * INTO UsersCopy FROM Users;
SELECT * FROM UsersCopy;

UPDATE UsersCopy
SET UserName = LOWER(LEFT(FirstName, 2) + LEFT(LastName, 2));

SELECT * FROM UsersCopy;




--*/---------------------------------------------------------------------------------------------
--/* Uppgift 3. Uppdatera airports
-------------------------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name LIKE 'AirportsCopy')
   DROP TABLE [dbo].AirportsCopy;
GO

SELECT * INTO AirportsCopy FROM Airports

UPDATE AirportsCopy
SET Time = '-' WHERE Time IS NULL

UPDATE AirportsCopy
SET DST = '-' WHERE DST IS NULL

SELECT COUNT(Time) AS 'Count null in Time' FROM AirportsCopy WHERE Time IS NULL




--*/---------------------------------------------------------------------------------------------
--/* Uppgift 4. Ta bort grundämnen
-------------------------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name LIKE 'ElementsCopy')
   DROP TABLE [dbo].ElementsCopy;
GO

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




--*/---------------------------------------------------------------------------------------------
--/* Uppgift 5. Kolla om namnet börjar med bokstäverna i 'Symbol'
-------------------------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name LIKE 'ElementsCopy')
   DROP TABLE [dbo].ElementsCopy;
GO

SELECT
    Symbol,
    Name,
    CASE
        WHEN LEFT(Name, 2) LIKE LEFT(Symbol, 2) THEN 'yes'
        ELSE 'no'
    END AS 'Yes/No'
INTO ElementsCopy FROM Elements

SELECT * FROM ElementsCopy ORDER BY NAME





--*/---------------------------------------------------------------------------------------------
--/* 6. Beräkna värdet i 'Code' från RGB-värdena
-------------------------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name LIKE 'ColorsCopy')
   DROP TABLE [dbo].ColorsCopy;
GO

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




--*/---------------------------------------------------------------------------------------------
--/* Uppgift 7. Beräkna 'Float', 'DateTime' och 'Bool' kolumnerna
-------------------------------------------------------------------------------------------------

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