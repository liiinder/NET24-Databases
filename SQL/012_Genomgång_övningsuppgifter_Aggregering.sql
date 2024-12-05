-- Ta ut (select) en rad f�r varje (unik) period i tabellen �Elements� med f�ljande kolumner: 
-- �period�, �from� med l�gsta atomnumret i perioden, �to� med h�gsta atomnumret i perioden, 
-- �average isotopes� med genomsnittligt antal isotoper visat med 2 decimaler, �symbols� med 
-- en kommaseparerad lista av alla �mnen i perioden.
/*
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


-- Ta ut en lista �ver regioner i tabellen �Countries� d�r det f�r varje region framg�r regionens namn,
-- antal l�nder i regionen, totalt antal inv�nare, total area, befolkningst�theten med 2 decimaler, 
-- samt sp�dbarnsd�dligheten per 100.000 f�dslar avrundat till heltal.

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

*/

-- Fr�n tabellen �Airports�, gruppera per land och ta ut kolumner som visar: land, antal flygplatser (IATA-koder), 
-- antal som saknar ICAO-kod, samt hur m�nga procent av flygplatserna i varje land som saknar ICAO-kod.

-- Clean up data to new table:
select
	--[Location served],
	--reverse([Location served]),
	--charindex(',', reverse([Location served])),
	--right([Location served], charindex(',', reverse([Location served]))),
	*,
	trim(concat(char(32), char(160), ',') from right([Location served], charindex(',', reverse([Location served])))) as 'Country'
into
	AirportsWithCountryColumn
from 
	Airports;


select 
	Country,
	count(IATA) as 'Number of airports',
	--count(ICAO) as 'Number of airports with ICAO',
	count(*) - count(ICAO) as 'Number of airports without ICAO',
	format((count(*) - count(ICAO)) / cast(count(IATA) as float), 'p') as 'Percentage of airports without ICAO'
from 
	AirportsWithCountryColumn
group by
	Country
order by
	(count(*) - count(ICAO)) / cast(count(IATA) as float)



--SELECT * FROM Airports WHERE IATA IN ('HLE', 'KKK')


 

