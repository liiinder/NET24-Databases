
-- Temporära tabeller skapas i systemdatabasen 'tempdb' (d.v.s ej i den databas man jobbar mot)
-- De har #(local, går endast att komma åt från sessionen som skapade dem),
-- eller ##(global, går att komma åt mellan sessioner) framför namnet tabellnamnet

SELECT id, FirstName, LastName INTO #myTempTable FROM Users WHERE FirstName like '[a-d]%'

SELECT id, FirstName, LastName INTO ##myGlobalTempTable FROM Users WHERE FirstName like '[a-d]%'
 
SELECT * from ##myGlobalTempTable;
