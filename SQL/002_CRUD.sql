
select * from students

insert into students (id, name) values(4, 'Bengt Bengtsson');

insert into students values(5, 'Erik Eriksson', '1998-02-13');

insert into students (id, birthdate) values(6, '1999-02-03');

select name, birthdate into newStudents from students where id > 3


insert into newStudents (name) values('Fredrik Fredriksson')
select * from newStudents

insert into newStudents(name, birthdate)
select name, birthdate from students where id < 3


update newStudents set name =  'test' where name like 'a%';

select * from newStudents

delete from newStudents where birthdate = '1999-02-03'
