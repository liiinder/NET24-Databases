--select * from students;

--om kolumnen heter "student id" istället för id så behövs [student id]
-- [] brackets eller "" för det övre beroende på standard.
/* 
    Multi line comment
*/
--use ITHS;

--select
--    -- Projection:
--    id,
--    name,
--    10 + id as 'id+10',
--    'hej ' + name as 'Greeting'
--from
--    students
--where
--    -- Selection:
--    id = 1;

--    /*
--        < mindre än
--        > större än
--        <= mindre eller lika med
--        >= större eller lika med
--        = lika med (istället för == )
--        <> inte lika med (men T-SQL tillåter även != )
--        and
--        or
--        not
--    */


---- Top, väljer dom första i listan (något microsoft har hittat på)...
---- https://www.w3schools.com/sql/sql_top.asp

----select top 1 * from students;

--/*
--    %n      : valfria bokstöver och sedan ett n
--    n_      : n och sen ett valfritt tecken
--    [sk]  : s eller k
--    [a-k] : matchar bokstäver mellan a till k
--    [1-4] : matchar siffror mellan 1 till 4
--*/

--select * from students where name like '%n_%';

use everyloop;

--select * from dbo.Airports;

--select * from Users w5here len(FirstName) = 5 order by FirstName desc; --asc är default
--select * from Users where len(FirstName) = 5 order by LastName, FirstName desc; --asc är default

--select distinct Region from Countries;

select country from Countries where Country like 'a%'
union all
select firstname from Users where firstname like 'a%' order by country asc;

Select FirstName,
    len(FirstName) as 'length of firstname',
    case
        when len(FirstName) < 4 then 'Kort'
        when len(FirstName) < 8 then 'Mellan'
        else 'Långt'
    end as 'Längd på namn'
From Users;