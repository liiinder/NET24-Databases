USE ITHS

--/* Example 1
DROP TABLE countries
DROP TABLE cities

CREATE TABLE countries
(
    id int,
    name nvarchar(max)
)

INSERT INTO countries values(1, 'Sweden')
INSERT INTO countries values(2, 'Norway')
INSERT INTO countries values(3, 'Denmark')
INSERT INTO countries values(4, 'Finland')

CREATE TABLE cities
(
    id int,
    name nvarchar(max),
    countryId int
)

INSERT INTO cities values(1, 'Stockholm', 1)
INSERT INTO cities values(2, 'Gothenburg', 1)
INSERT INTO cities values(3, 'Malmö', 1)
INSERT INTO cities values(4, 'Oslo', 2)
INSERT INTO cities values(5, 'Bergen', 2)
INSERT INTO cities values(6, 'Copenhagen', 3)
INSERT INTO cities values(7, 'London', 8)

SELECT
    co.id as 'Id',
    co.name as 'Country',
    count(ci.name) as 'Cities',
    isnull(string_agg(ci.name, ', '), '-') as 'City names'
FROM
    countries co LEFT JOIN cities ci
    ON co.id = ci.countryId
GROUP BY
    co.id, co.name
ORDER BY
    'Cities' desc

--*/----------------------------------------------------------------------------------

--/* Example - Many to many - junction table

DROP TABLE courses
DROP TABLE students
DROP TABLE coursesStudents

create table courses
( 
	id int, 
	name nvarchar(max)
)
	
insert into courses values(1, 'C#');
insert into courses values(2, 'Databaser');
insert into courses values(3, 'Javscript');
insert into courses values(4, 'Databehandling');
insert into courses values(5, 'Clean Code');

create table students
( 
	id int, 
	name nvarchar(max)
)

insert into students values(1, 'Emma');
insert into students values(2, 'Thomas');
insert into students values(3, 'Stefan');
insert into students values(4, 'Camilla');
insert into students values(5, 'Maria');
insert into students values(6, 'Anna');
insert into students values(7, 'Karl');

CREATE TABLE coursesStudents
(
	courseId int,
	studentId int
)

insert into coursesStudents values(1, 1)
insert into coursesStudents values(1, 4)
insert into coursesStudents values(1, 5)
insert into coursesStudents values(1, 7)
insert into coursesStudents values(2, 1)
insert into coursesStudents values(2, 2)
insert into coursesStudents values(2, 5)
insert into coursesStudents values(3, 2)
insert into coursesStudents values(3, 3)
insert into coursesStudents values(3, 4)
insert into coursesStudents values(3, 5)
insert into coursesStudents values(3, 7)
insert into coursesStudents values(4, 1)
insert into coursesStudents values(4, 4)
insert into coursesStudents values(4, 5)
insert into coursesStudents values(4, 7)

--SELECT * FROM courses 
--SELECT * FROM students 
--SELECT * FROM coursesStudents 

--SELECT 
--	c.name as 'Kurs',
--	s.name as 'Student'
--FROM 
--	courses c JOIN coursesStudents cs ON c.id = cs.courseId
--		JOIN students s ON s.id = cs.studentId
--ORDER BY
--	s.name

SELECT
	s.name as 'Student',
	count(c.name) as 'Antal kurser'
FROM 
	courses c JOIN coursesStudents cs ON c.id = cs.courseId
		JOIN students s ON s.id = cs.studentId
GROUP BY
	s.name

--*/----------------------------------------------------------------------------------