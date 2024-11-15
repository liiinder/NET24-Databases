USE everyloop

--SELECT * FROM company.products

-- company.order
-- har ShipCity ...

-- company.order_details
-- har ProductId

-- count(company.products)

declare @amountOfProducts int

SELECT @amountOfProducts = count(Id) FROM company.products

print @amountOfProducts



SELECT 
	ProductId
FROM
	company.orders o JOIN company.order_details od ON o.Id = od.OrderId
WHERE 
	o.ShipCity LIKE 'London'
GROUP BY
	ProductId
ORDER BY
	ProductId