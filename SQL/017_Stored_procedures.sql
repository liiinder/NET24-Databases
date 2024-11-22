
-- stored procedure
go

alter procedure myProcedure @timestamp datetime = '2020-01-01', @name nvarchar(20) as
begin
	declare @now datetime = getdate();

	select 
		@timestamp as 'Timestamp',
		@now as 'Now',
		datediff(day, @timestamp, @now) as 'Diff',
		@name as 'Name'

	return len(@name);
end

go

exec myProcedure '2024-01-01', 'Fredrik';

------------------------

go

alter procedure random @rows int = 1, @total float output as
begin
	set nocount on;

	declare @i int = 1;

	declare @t table
	(
		n int,
		r float
	)

	while @i <= @rows
	begin
		insert into @t values(@i, rand());
		set @i += 1;
	end

	select @total = sum(r) from @t;
	select * from @t

	set nocount off;
end

go

declare @result float;

exec random @rows = 10, @total = @result output

print @result



