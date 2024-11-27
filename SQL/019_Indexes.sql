
create table indexDemo
(
	a int,
	b int,
	c int
)

insert into indexDemo select value, 1000001 - value, abs(checksum(newid())) % 10 from generate_series(1, 1000000)


create table indexDemo_pk
(
	a int primary key,
	b int,
	c int
)

insert into indexDemo_pk select value, 1000001 - value, abs(checksum(newid())) % 10 from generate_series(1, 1000000)


create table indexDemo_pk_index
(
	a int primary key,
	b int,
	c int
)

insert into indexDemo_pk_index select value, 1000001 - value, abs(checksum(newid())) % 10 from generate_series(1, 1000000)


create table indexDemo_pk_index_with_c
(
	a int primary key,
	b int,
	c int
)

insert into indexDemo_pk_index_with_c select value, 1000001 - value, abs(checksum(newid())) % 10 from generate_series(1, 1000000)



select c from indexDemo_pk_index where b = 576473;
select c from indexDemo_pk_index_with_c where b = 576473;




