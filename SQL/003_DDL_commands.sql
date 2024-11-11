--DDL is a set of SQL commands used to create, modify, and delete database structures but not data. 
--These commands are normally not used by a general user, who should be accessing the database via an application.

create database myDatabase;

use myDatabase;

create table teachers
(
	id int primary key,
	firstname nvarchar(max),
	lastname nvarchar(max),
	birthdate datetime2
)

insert into teachers(id, firstname) values(1, 'Fredrik');
insert into teachers(id, firstname) values(2, 'Anders');

delete from teachers where id = 2;

select * from teachers;

drop table teachers;

drop database myDatabase;



