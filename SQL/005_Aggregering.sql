
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



