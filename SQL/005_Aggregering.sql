
select * from Elements where Radius is null


select 
	count(*) as 'Number of rows',
	count(Mass) as 'Number of values in column Mass',
	count(Radius) as 'Number of values in column Radius',
	count(*) - count(Radius) as 'Number of NULLs in column Radius'
from 
	Elements


select * from Elements where Number <= 5

select
	count(Stableisotopes) as 'Number of values',
	sum(Stableisotopes) as 'Sum of values',
	min(Stableisotopes) as 'Minimum value',
	max(Stableisotopes) as 'Maximum value',
	avg(cast(Stableisotopes as float)) 'Average',
	sum(cast(Stableisotopes as float)) / count(Stableisotopes) as 'Also average',
	string_agg(Symbol, ', ') as 'Symbols'
from
	Elements
where 
	Number <= 5


select * from Elements

select
	Period,
	StableIsotopes,
	count(*) as 'Row count'
--	count(Stableisotopes),
--	min(Stableisotopes),
--	max(Stableisotopes)

from 
	Elements 
group by
	Period, Stableisotopes
order by Period, Stableisotopes

select * from dbo.Elements

select id, OrderDate, ShipRegion, ShipCountry, ShipCity from company.orders order by ShipRegion, ShipCountry, ShipCity

select 
	ShipRegion,
	ShipCountry,
	ShipCity,
	count(*) as 'Number of orders'
from 
	company.orders
group by
	ShipRegion, ShipCountry, ShipCity
order by
	ShipRegion, ShipCountry, ShipCity






