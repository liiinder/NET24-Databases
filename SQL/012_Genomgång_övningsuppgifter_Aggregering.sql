-- Ta ut (select) en rad för varje (unik) period i tabellen ”Elements” med följande kolumner: 
-- ”period”, ”from” med lägsta atomnumret i perioden, ”to” med högsta atomnumret i perioden, 
-- ”average isotopes” med genomsnittligt antal isotoper visat med 2 decimaler, ”symbols” med 
-- en kommaseparerad lista av alla ämnen i perioden.

select 
	Period,
	min(Number) as 'From',
	max(Number) as 'To',
	format(avg(cast(Stableisotopes as float)), 'F2') as 'Average isotopes',
	format(sum(cast(Stableisotopes as float)) / count(Stableisotopes), 'F2') as 'Average isotopes',
	string_agg(Symbol, ', ') as 'Symbols'
from 
	Elements
group by
	Period


-- Ta ut en lista över regioner i tabellen ”Countries” där det för varje region framgår regionens namn,
-- antal länder i regionen, totalt antal invånare, total area, befolkningstätheten med 2 decimaler, 
-- samt spädbarnsdödligheten per 100.000 födslar avrundat till heltal.

select * from Countries


select 
	Region,
	count(*) as 'Number of countries',
	sum(cast(Population as bigint)) as 'Inhabitants',
--	sum(cast(Population as float)) as 'Inhabitants'
	sum(cast([Area (sq# mi#)] as bigint)) as 'Total area',
	format(avg(CAST(REPLACE([Pop# Density (per sq# mi#)], ',', '.') as float)), 'N2') as 'Population density'
from 
	Countries
group by
	Region
