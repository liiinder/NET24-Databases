USE everyloop

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'UsersCopy')
   DROP TABLE [dbo].UsersCopy;
GO

SELECT * INTO UsersCopy FROM Users

SELECT TOP 10 * FROM UsersCopy

BEGIN TRANSACTION
UPDATE UsersCopy SET username = '---' WHERE firstname LIKE 'a%'
COMMIT -- eller ROLLBACK ?????

BEGIN TRANSACTION
UPDATE UsersCopy SET username = '***' WHERE firstname LIKE 'b%'
COMMIT

SELECT * FROM UsersCopy