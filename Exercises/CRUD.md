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


