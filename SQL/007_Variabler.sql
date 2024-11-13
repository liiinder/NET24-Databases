
declare @name nvarchar(max) = 'Sigfrid';
declare @lastname nvarchar(max) = '';

--print @name;

--set @name = 'Sigge'

--print @name

--select * from Users order by FirstName


select @lastname += LastName + '; ' from Users where FirstName = @name

select @lastname



-------------------


declare @myTable as Table
(
	firstname nvarchar(20),
	lastname nvarchar(20)
)

insert into @myTable values('Gustav', 'Gustavsson');
insert into @myTable values('Sven', 'Svensson');

select * from @myTable;
