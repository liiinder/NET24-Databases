# Övningsuppgifter med CRUD-operationer i SQL


Börja med att ladda ner [everyloop.bak](https://github.com/everyloop/NET24-Databases/tree/master/Resources/everyloop.bak)  och gör en "Restore".

För de övningsuppgifter som kräver att ni ändrar i en tabell (insert, update,
delete) se först till att kopiera orginaltabellen i everyloop till en ny tabell, som ni sedan kan modifiera. På så vis har ni alltid orginalet kvar oförändrat.


**Exempel:** 
``` SQL
select * into UsersCopy from Users;
```

Om ni råkat ändra orginalet och vill ha tillbaks det så kan ni återställa databasen
från backupfilen. Ni kan antingen återställa backupen och skriva över den
databasen ni redan har (då försvinner alla ändringar ni gjort), eller så kan ni
återställa den till en ny databas, t.ex. everyloop2.

## 1. Game of thrones
Ta ut data (select) från tabellen GameOfThrones på sådant sätt att ni får ut
en kolumn ’Title’ med titeln samt en kolumn ’Episode’ som visar episoder
och säsonger i formatet ”S01E01”, ”S01E02”, osv.
Tips: kolla upp funktionen format()

## 2. Uppdatera användarnamn
Uppdatera (kopia på) tabellen user och sätt username för alla användare så
den blir de 2 första bokstäverna i förnamnet, och de 2 första i efternamnet
(istället för 3+3 som det är i orginalet). Hela användarnamnet ska vara i små
bokstäver.

## 3. Uppdatera airports
Uppdatera (kopia på) tabellen airports så att alla null-värden i kolumnerna
Time och DST byts ut mot ’-’

## 4. Ta bort grundämnen
Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon av
följande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader där ”Name” börjar på någon av bokstäverna d, k, m, o, eller u.

## 5. Kolla om namnet börjar med bokstäverna i 'Symbol'
Skapa en ny tabell med alla rader från tabellen Elements. Den nya tabellen
ska innehålla ”Symbol” och ”Name” från orginalet, samt en tredje kolumn
med värdet ’Yes’ för de rader där ”Name” börjar med bokstäverna i
”Symbol”, och ’No’ för de rader där de inte gör det.

    Ex: ’He’ -> ’Helium’ -> ’Yes’, ’Mg’ -> ’Magnesium’ -> ’No’.

## 6. Beräkna värdet i 'Code' från RGB-värdena
Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”. Gör
sedan en select från Colors2 som ger samma resultat som du skulle fått från
select * from Colors; (Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

## 7. Beräkna 'Float', 'DateTime' och 'Bool' kolumnerna
Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” till en ny
tabell. Gör sedan en select från den nya tabellen som ger samma resultat
som du skulle fått från select * from types;

Vissa uppgifter ovan kan kräva att ni använder funktioner vi inte gått igenom
ännu. Kolla [dokumentationen för SQL Server](https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver16), och se om ni kan hitta lämpliga
funktioner där. Jag har även gjort en sammanställing av [några av de vanligaste funktionerna här!](https://github.com/everyloop/NET24-Databases/blob/master/Resources/SQL_functions_overview.md)

Spara era queries och ta med vid nästa tillfälle, så går vi igenom uppgifterna och
ser om vi kan lösa dem tillsammans.
