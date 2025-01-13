# Januari 9

## MongoDB.EntityFrameworkCore

MongoDB provider för EF core släpptes i Maj 2024 (men har funnits som "preview" sedan 2023). Detta innebär att den är ganska ny och det märks även när man söker på internet då det kan vara svårt att hitta så mycket information och hjälp. 

Den officiella dokumentationen hittar du [här!](https://www.mongodb.com/docs/entity-framework/current/)

**Code-along:**  
[L011_MongoDB_EFcore](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L011_MongoDB_EFcore)  
[L012_MovieDB](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L012_MovieDB)  

## Repository Pattern

Repository Pattern är ett vanligt förekommande design pattern som hjälper för att separera databashantering från övrig kod. Vi kollar på hur detta fungerar med gemensam code-along.

Notera dock att entity framework redan bygger på repository pattern (med DbContext som unit-of-work och DbSet<> som repositories), vilket gör att det blir lite kaka-på-kaka att själv implementera det i samband med EFcore. Vilket vi också ser i vår code-along där de flesta funktioner bara passar vidare argumenten till EFcores metoder.

Kollar man runt lite på nätet hittar man (som vanligt) olika åsikter om hurvida det bör använda ihop med EFcore. Se t.ex [denna artikeln](https://www.thereformedprogrammer.net/is-the-repository-pattern-useful-with-entity-framework-core/) för en överblick av vanliga argument för och emot.

**Code-along:**  
[L013_RepositoryPattern](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L013_RepositoryPattern)  