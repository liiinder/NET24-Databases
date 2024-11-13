declare @name NVARCHAR(max) = 'Frida'
declare @lastname NVARCHAR(max)

print @name

-- set @name = 'Fredrik'

print @name

SELECT * FROM Users;
SELECT @lastname = LastName FROM Users WHERE FirstName = @name

print @lastname