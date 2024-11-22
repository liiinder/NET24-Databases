
-- Vy / View

select * into newUsers from users;

ALTER view [dbo].[myView] with schemabinding as
select
	FirstName,
	LastName,
	email,
	phone
from
	dbo.newUsers
where
	FirstName like '[a-d]%' with check option

drop table newUsers;

select * from myView

insert into myView (FirstName, LastName) values('Albert', 'Johansson');


select * from newusers;






