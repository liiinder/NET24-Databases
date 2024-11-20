drop table compositeKeyDemo;

create table compositeKeyDemo
(
	id int not null,
	firstName nvarchar(20) not null,
	primary key(id, firstName)
)

-- Composite key, varken id eller firstName behöver då vara unik ...
insert into compositeKeyDemo values(1, 'kalle');
insert into compositeKeyDemo values(1, 'fredrik');
insert into compositeKeyDemo values(2, 'fredrik');

-- ... men vi kan inte sätta in en kombination av de två som redan finns. (PK måste vara unik)
insert into compositeKeyDemo values(2, 'fredrik');

select * from compositeKeyDemo

-------------------

drop table constraintsDemo;

create table constraintsDemo
(
	id int primary key identity(1, 1),
	firstName nvarchar(20) default('Fredrik'),
	createdAt datetime2 default(getdate())

	--firstName nvarchar(20) check(firstName like 'a%' and len(firstName) = 10),
	--personNummer nvarchar(20) check(personNummer like '[0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
)

insert into constraintsDemo default values;

select * from constraintsDemo



