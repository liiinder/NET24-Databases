# December 19

## Introduktion till Sqlite

SQLite är ett populärt val som inbyggd databas för lokal lagring i en applikation. I motsats till andra databashanterare är SQLite inte en separat process som nås från användarens applikation, utan en integrerad del av densamma.

SQLite används över hela världen för testning, utveckling och i alla andra scenarion där det är vettigt att databasen finns på samma disk som applikationskoden .

[Läs mer här!](https://www.sqlite.org/about.html)

## Sqlite i EF core

**Code-along:**  
[L010_Sqlite](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L010_Sqlite)

Denna code-along är mestadels en repetition, eftersom den enda skillnaden mot tidigare är att vi använder en annan "database provider" (Sqlite, istället för SQL Server).

Skillnanden består alltså i hur vi configurerar upp vår DbContext, då varje provider tillhandahåller sina egna extension methods på OnConfiguring-metodens DbContextOptionBuilder-objekt; i detta fall UseSqlite(), istället för UseSqlServer().

I övrigt jobbar man med EF core som vanligt. Resterande delar av en applikation behöver alltså normalt inte uppdateras bara för att man byter database provider.

Vi kollar också på hur man kan använda [DB Browser for SQLite](https://sqlitebrowser.org/) för att läsa och redigera SQLite databasfiler.
