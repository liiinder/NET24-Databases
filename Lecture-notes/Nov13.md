# November 13

**Lecture slides:**  
[Aggregering.pdf](https://github.com/everyloop/NET24-Databases/blob/master/Resources/Aggregering.pdf)  
[Datatyper och variabler.pdf](https://github.com/everyloop/NET24-Databases/blob/master/Resources/Datatyper%20och%20variabler.pdf)

## Format()

T-SQL funktionen format() använder .NET's formateringssträngar. D.v.s samma strängar som man kan använda i .toString() metoden i C#:

[Formateringssträngar i .NET](https://learn.microsoft.com/en-us/dotnet/standard/base-types/formatting-types)

## Aggregering

**Code-along:**  
[005_Aggregering.sql](https://github.com/everyloop/NET24-Databases/blob/master/SQL/005_Aggregering.sql)

## Datatyper

[Datatyper i T-SQL](https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16)

## Variabler

**Code-along:**  
[007_Variabler.sql](https://github.com/everyloop/NET24-Databases/blob/master/SQL/007_Variabler.sql)

## Temporära tabeller

**Code-along:**  
[008_Temporära_tabeller.sql](https://github.com/everyloop/NET24-Databases/blob/master/SQL/008_Tempor%C3%A4ra_tabeller.sql)

## GUID
Globally Unique Identifier (GUID) är en typ av identifierare som används i programvara och som är tänkt att vara globalt unikt. Termen Universally Unique Identifier (UUID) förekommer också. Det totala antalet unika nycklar är 2128 (cirka 3,4×1038) så sannolikheten för att samma tal genereras fler än en gång är mycket liten. Om varje människa på jorden genererade 600 miljoner nycklar skulle sannolikheten för att två likadana genereras ligga på 50%. En nyckel innehåller oftast 128 bitar.

En GUID är uppbyggd av 32 hexadecimala siffror och 4 bindestreck och ser ut på följande sätt, 123e4567-e89b-12d3-a456-426655440000

## Primary key

En kolumn markerad som primary key måste innehålla unika värden.

Som primary key används vanligen en av följande:
1. Ett löpnummer (integer tillsammans med [identity](https://www.red-gate.com/simple-talk/databases/sql-server/learn/sql-server-identity-column/))
2. Ett [GUID](https://sv.wikipedia.org/wiki/Globally_Unique_Identifier) (datatyp uniqueidentifier, tillsammans med newid() för att generera guid)
3. Något som redan är unikt, t.ex personnummer, produktnummer, ISBN

**Code-along:**  
[006_PrimaryKey.sql](https://github.com/everyloop/NET24-Databases/blob/master/SQL/006_PrimaryKey.sql)
