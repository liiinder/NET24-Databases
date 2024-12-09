# December 2

**Code-along:**  
[L004_Intro_EFcore](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L004_Intro_EFcore)  
 
## Entity Framework Core

Entity Framework Core är ett ramverk som gör att man slipper skriva SQL-kommandon själv. EF fungerar som en mellanhand – vi kan säga åt EF hur datan som ska sparas ser ut och vad som ska göras med den, och EF förvandlar det till databaskommandon åt oss, och sköter interaktionen med databasen.

[Översikt!](https://learn.microsoft.com/en-us/ef/core/)

## DbContext

En klass som representerar kopplingen till en databas, och som kommunikationen med databasen sker genom. Detta kallas en databas-kontext.

Man skapar en egen databaskontext, med egna inställningar, genom att skapa en klass som ärver från DbContext.

[Läs mer här!](https://learn.microsoft.com/en-us/ef/core/dbcontext-configuration/)

## Migrations

Migrations används för att antingen generera en databasfil från klasser eller tvärtom. När man genererar en databas utifrån klasser kallas det att man arbetar "code first".

En migration är, lite förenklat, en databasförändring. Det betyder att man gör en stor migration i början när man först skapat sin modell, och sedan kan göra förändringar i form av fler migrationer i efterhand.

[Läs mer här!](https://learn.microsoft.com/en-us/ef/core/managing-schemas/migrations/?tabs=vs)