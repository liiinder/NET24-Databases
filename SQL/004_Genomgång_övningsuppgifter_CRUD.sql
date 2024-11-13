
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


