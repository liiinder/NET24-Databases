/*
	Blockkommentar
*/

-- Radkommentar

select 
	-- Projection:
	[id], 
	"name", 
	id, 10 + id as 'idPlus10', 
	'hej ' + name as 'greeting' 
from 
	students
where
	-- Selection:
	/*
	< mindre än
	> större än
	<= mindre eller lika med
	>= större eller lika med
	= lika med (istället för == som i c#)
	<> inte lika med (men T-SQL tillåter även != )
	and (motsvarar c# &&)
	or  (motsvarar c# ||)
	not (motsvarar c# !)
	*/
	id > 1 and id < 3;

-- Begränsa antal rader som skickas tillbaks
select top 2 * from students;


-- select * from students where id between 2 and 3
-- select * from students where id >= 2 and id <= 3

select * from students where name = 'A%';

-- Byter databas
use everyloop;

-- Order by används för sortering (ASC = ascending, DESC = descending)
select * from Users where len(FirstName) = 5 order by FirstName;

select top 5 * from users order by LastName desc, FirstName asc






