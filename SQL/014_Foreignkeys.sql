drop table countries;
drop table cities;

create table countries
(
	id int primary key,
	name nvarchar(max)
);


insert into countries values(1, 'Sweden');
insert into countries values(2, 'Norway');
insert into countries values(3, 'Denmark');
insert into countries values(4, 'Finland');


create table cities
(
	id int primary key,
	name nvarchar(max),
	countryId int FOREIGN KEY REFERENCES countries(id),

)

insert into cities values(1, 'Stockholm', 1);
insert into cities values(2, 'Gothenburg', 1);
insert into cities values(3, 'Malmö', 1);
insert into cities values(4, 'Oslo', 2);
insert into cities values(5, 'Bergen', 2);
insert into cities values(6, 'Copenhagen', 3);
--insert into cities values(7, 'London', 8);

select * from countries;
select * from cities;

update cities set countryId = 3 where id = 6;

begin transaction
rollback


delete from countries where id = 2;
update countries set id = 12 where id = 1;



