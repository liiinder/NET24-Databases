-- En kolumn markerad som primary key måste innehålla unika värden.

-- Primary key är en av följande:
-- 1. Ett löpnummer (integer tillsammans med identity)
-- 2. Ett guid (datatyp uniqueidentifier, tillsammans med newid() för att generera guid)
-- 3. Något som redan är unikt, t.ex personnummer, produktnummer, ISBN


-- 1. Tabell med löpnummer som primary key
drop table products

create table products
(
	id int primary key identity(1, 1),
	name nvarchar(100)
)

--delete from products;
--truncate table products;

insert into products (name) values('keyboard');

select * from products;


-- 2. Tabell med GUID som primary key

select newid()

drop table productsGUID

create table productsGUID
(
	id uniqueidentifier primary key default(newid()),
	name nvarchar(100)
)

insert into productsGUID (name) values('keyboard');

select * from productsGUID;

