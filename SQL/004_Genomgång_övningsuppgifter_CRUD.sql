
-- Ta ut data (select) från tabellen GameOfThrones på sådant sätt att ni får ut en kolumn ’Title’ med titeln,
-- samt en kolumn ’Episode’ som visar episoder och säsonger i formatet ”S01E01”, ”S01E02”, osv. 
-- Tips: kolla upp funktionen format()

-- select * from GameOfThrones

select
	Title,
	'S' + right('00' + cast(Season as nvarchar), 2) + 'E' + right('00' + cast(EpisodeInSeason as nvarchar), 2) as Episode,
	'S' + format(Season, '0#') + 'E' + format(EpisodeInSeason, '0#') as 'Episode 2',
	concat('S', format(Season, '00'), 'E', format(EpisodeInSeason, '00')) as 'Episode 3'

from 
	GameOfThrones

-- myInt.toString("F3");
-- $"{myInt:F3}"

select format(2.45677, 'F3')

select format(123.456, '0000.00')
select format(123.456, '####.##')



-- Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” till en ny tabell. 
-- Gör sedan en select från den nya tabellen som ger samma resultat som du skulle fått från select * from types;


 
Select 
	Integer,
	String
into 
	NewTypes 
from 
	Types


select * from newTypes;
select * from Types;

select 
	Integer,
	CAST(Integer AS FLOAT)/100 as 'Float',
	String,
	DATEADD(Day,INTEGER,'2018-12-31')+ DATEADD(MINUTE,Integer,'09:00:00') AS DateTime,
	case 
		when Integer % 2 = 0 then '0'
		else '1'
	END as Bool,
	integer % 2 as 'Bool'

from 
	NewTypes 



