--/* Examples ... (Count räknar inte null)

SELECT 
    COUNT(*) as 'Number of rows',
    COUNT(mass) as 'Number of values in column mass',
    COUNT(Radius) as 'Number of values in radius',
    COUNT(*) - COUNT(Radius) as 'Radius which is null',
    SUM(StableIsotopes) as 'SUM',
    MIN(StableIsotopes) as 'MIN',
    MAX(StableIsotopes) as 'MAX',
    AVG(cast(StableIsotopes as float)) as 'AVG', -- Doesnt care about null values so its a bit wrong...
    STRING_AGG(Symbol, ', ') as 'Symbols'
FROM Elements
WHERE Number <= 5;

select * from Elements

--*/----------------------------------------------------------------------------------------------------

--/* Example 2... Group By

SELECT * FROM Elements

SELECT
    Period,
    StableIsotopes,
    Count(*) as 'Row count'
    --count(StableIsotopes) as 'Count(stableisotopes)',
    --min(StableIsotopes)
FROM
    Elements
GROUP BY
    Period, StableIsotopes

--*/---------------------------------------------------------------------------------------------------

--/* Example: ORDER BY 

SELECT
   ShipRegion,
   ShipCountry,
   ShipCity,
   Count(*) as 'Number of Orders'
FROM company.orders
GROUP BY
   ShipRegion,
   ShipCountry,
   ShipCity
ORDER BY
   'Number of Orders' desc

--*/---------------------------------------------------------------------------------------------------

--/* Example: HAVING

SELECT
    ShipRegion,
    Count(*) as 'Number of Orders'
FROM company.orders
WHERE OrderDate < '2013-01-01 00:00'
GROUP BY
    ShipRegion
HAVING count(*) > 10
ORDER BY
    'Number of Orders' desc

--*/---------------------------------------------------------------------------------------------------

--/* Example: Primary Key

CREATE TABLE products
(
    -- id int PRIMARY KEY IDENTITY(1, 1),
    -- id UNIQUEIDENTIFIER PRIMARY KEY,
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
    name NVARCHAR(100)
)

-- With identity(1, 1) you dont have to specify id / NEWID();
-- INSERT into products (name) VALUES('keyboard');

-- Without default you have to specify id.
-- INSERT into products (id, name) VALUES(NEWID(), 'keyboard');

-- With default you dont have to specify id.
INSERT into products (name) VALUES('keyboard');
INSERT into products (name) VALUES('keyboard');
INSERT into products (name) VALUES('keyboard');

SELECT * FROM products;

-- Empties the table but keeps the columns
--TRUNCATE TABLE products;

--SELECT NEWID()

-- Delete it all.
DROP TABLE products;

--*/---------------------------------------------------------------------------------------------------