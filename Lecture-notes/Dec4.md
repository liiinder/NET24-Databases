# December 4

## Conventions, Annotations & FluentAPI

EF Core använder en metadata-modell för att beskriva hur applikationens entitetstyper mappas till den underliggande databasen. Denna modell är byggd enligt en uppsättning konventioner.

Modellen kan sedan anpassas med hjälp av mappningsattribut (Data Annotations) och/eller anrop till ModelBuilder-metoderna (fluent-API) i OnModelCreating. Båda alternativen kommer att åsidosätta den konfiguration som utförs av konventioner. Fluent-API gäller dock alltid över Data Annotations, och har fler valmöjligheter för konfiguration.

[Läs här!](https://learn.microsoft.com/sv-se/ef/core/modeling/)

**Code-along:**  
[L006_ModelConfiguration](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L006_ModelConfiguration)  

## One-To-Many, Many-To-Many

[One-To-Many](https://learn.microsoft.com/sv-se/ef/core/modeling/relationships/one-to-many)

[Many-To-Many](https://learn.microsoft.com/sv-se/ef/core/modeling/relationships/many-to-many)

**Code-along:**  
[L007_Relationships](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L007_Relationships)  

## Eager loading vs Explicit loading

Eager loading hämtar all relaterad data som en del av den initiala frågan med hjälp av joins i databasen när det behövs.

[Läs här om Eager loading](https://learn.microsoft.com/sv-se/ef/core/querying/related-data/eager)

Explicit loading innebär att relaterade data hämtas från databasen vid ett senare tillfälle. Man får alltså be om den i efterhand, vilket gör att man inte behöver hämta lika mycket data från början, men istället blir det mindre mängd data vid fler tillfällen.

[Läs här om Explicit loading](https://learn.microsoft.com/sv-se/ef/core/querying/related-data/explicit)

**Code-along:**  
[L007_Relationships](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L007_Relationships) 
 
