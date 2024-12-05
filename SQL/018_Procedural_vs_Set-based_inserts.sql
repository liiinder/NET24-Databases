drop table demoData

create table demoData
(
	id int primary key identity(1,1),
	timestamp datetime2 default(getdate())
)

go 

truncate table demoData;

go

-- Skicka 100.000 separate inserts fr�n klient till server ~ 30 sekunder.
insert into demoData default values;
go 100000

select * from demoData;


-- Skicka ett (1) skript som g�r 100.000 separata inserts p� server-sidan ~ 15 sekunder.
declare @i int = 0

while @i < 100000 
begin
	insert into demoData default values;
	set @i += 1;
end



select * from generate_series(0, 100)

-- Set-baserad l�sning med en (1) insert som s�tter in 100.000 rader.
insert into demoData(timestamp) select getdate() from generate_series(1, 100000);

