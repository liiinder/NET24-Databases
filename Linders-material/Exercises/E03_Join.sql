USE everyloop

--Med tabellerna fr�n schema �company�, svara p� f�ljande fr�gor:




--F�retagets totala produktkatalog best�r av 77 unika produkter. Om vi kollar bland v�ra ordrar, hur stor andel av dessa produkter har vi n�gon g�ng leverarat till London?

declare @amountOfProducts float
declare @shippedToLondon float

SELECT @amountOfProducts = count(Id) FROM company.products

SELECT @shippedToLondon = COUNT(DISTINCT ProductID)
FROM company.orders o JOIN company.order_details od ON o.Id = od.OrderId
WHERE o.ShipCity LIKE 'London'

print 'Andel unika produkter skickade till London: ' + CAST(FORMAT(CAST(@shippedToLondon as float) / CAST(@amountOfProducts as float) * 100, 'f1') as NVARCHAR(100)) + '%'

SELECT ShipCity as 'Stad',
	COUNT(DISTINCT ProductID) as 'Unika produkter',
	CAST(FORMAT(CAST(@shippedToLondon as float) / CAST(@amountOfProducts as float) * 100, 'f1') as NVARCHAR(100)) + '%' as 'Procent'
FROM
	company.orders o JOIN company.order_details od ON o.Id = od.OrderId
GROUP BY ShipCity
HAVING o.ShipCity LIKE 'London'
ORDER BY 'Unika produkter' desc




--Till vilken stad har vi levererat flest unika produkter?

SET ROWCOUNT 1
SELECT ShipCity as 'Stad',
	COUNT(DISTINCT ProductID) as 'Unika produkter'
FROM
	company.orders o JOIN company.order_details od ON o.Id = od.OrderId
GROUP BY ShipCity
ORDER BY 'Unika produkter' desc
SET ROWCOUNT 0




--Av de produkter som inte l�ngre finns I v�rat sortiment, hur mycket har vi s�lt f�r totalt till Tyskland?
SELECT 
	ShipCountry as 'Country',
	SUM(od.UnitPrice) * SUM(Quantity) as 'Totally billed'
FROM 
	Company.orders o 
	JOIN company.order_details od 
	ON o.Id = od.OrderId 
	JOIN company.products p
	ON p.Id = od.ProductId
WHERE 
	ShipCountry = 'Germany' AND -- Remove/Comment out for all countries.
	Discontinued = 1
GROUP BY ShipCountry
ORDER BY 'Totally billed' desc




--F�r vilken produktkategori har vi h�gst lagerv�rde?

SELECT
	CategoryName,
	SUM(UnitPrice) * SUM(UnitsInStock) as 'Inventory value'
FROM company.products p
	JOIN company.categories c
	ON p.CategoryId = c.Id
GROUP BY CategoryName




--Fr�n vilken leverant�r har vi s�lt flest produkter totalt under sommaren 2013?

SELECT 
	CompanyName,
	SUM(Quantity) as 'Quant'
FROM 
	company.products p
	JOIN company.suppliers s
	ON p.SupplierId = s.Id
	JOIN company.order_details od
	ON od.ProductId = p.Id
GROUP BY CompanyName
ORDER BY 'Quant' desc