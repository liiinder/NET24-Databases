# November 18

**Lecture slides:**  
[ACID-Transaktioner.pdf](https://github.com/everyloop/NET24-Databases/blob/master/Resources/ACID-Transaktioner.pdf)

## Connection string

En connection string är den information som behövs för att din applikation ska nå din databas, till exempel ett databasnamn, användarnamn, lösenord, port etc...

På [connectionstrings.com](https://www.connectionstrings.com/) hittar du connection strings för de vanligaste typerna av databaser.

## SqlClient

Microsoft.Data.SqlClient är ett namespace som innehåller klasser för att ansluta och skicka queries mot SQL server. SqlClient finns som ett nuget-package som du kan installera till dina projekt.

**Code-along:**  
[L001_SqlClient](https://github.com/everyloop/NET24-Databases/blob/master/Code-along/L001_SqlClient/Program.cs)

## SQL-injection

En SQL injection-attack utnyttjar en säkerhetsbrist som har sin grund i att utvecklaren har misslyckats med att isolera extern fientlig information från applikationens interna funktionalitet. Det gör det möjligt för en angripare att köra kod eller kommandon.

Konkatenera aldrig input från användare med SQL-kod som ska skickas till databasservern. Använd istället parameterized queries för att skydda från SQL-injection-attacker.

Se exempel i kommentarerna i koden ...

**Code-along:**  
[L002_SQL-injection_demo](https://github.com/everyloop/NET24-Databases/blob/master/Code-along/L002_SQL-injection_demo/Program.cs)