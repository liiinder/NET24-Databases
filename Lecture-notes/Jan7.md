# Januari 7

**Lecture slides:**  
[Introduktion till NoSQL.pdf](https://github.com/everyloop/NET24-Databases/blob/master/Resources/Introduktion%20till%20NoSQL.pdf)  

## MongoDB

Vi kör MongoDB lokalt på datorn genom att ladda ner och installera [MongoDB Community Server](https://www.mongodb.com/try/download/community).

Sedan har vi kollat på 3 olika klienter för att ansluta mot vår server:
- [Mongo Shell](https://www.mongodb.com/try/download/shell)
- [Compass](https://www.mongodb.com/try/download/shell)
- [MongoDB for VS Code](https://www.mongodb.com/products/tools/vs-code)

## CRUD-operationer

### Create

För att sätta in dokument i en collection använder man [insertOne()](https://www.mongodb.com/docs/manual/reference/method/db.collection.insertOne/) och [insertMany()](https://www.mongodb.com/docs/manual/reference/method/db.collection.insertMany/).

Till skillnad mot SQL/RDBMS behöver man inte skapa varken collection eller databas i förväg, utan dessa skapas automatiskt (om de inte redan finns) så fort man sätter in dokument.

### Read
För att hämta dokument från en collection använder man [find()](https://www.mongodb.com/docs/manual/reference/method/db.collection.find/) och [findOne()](https://www.mongodb.com/docs/manual/reference/method/db.collection.findOne/).

Oftast vill man bara hämta dokument som matchar vissa kriterier, och man kan då skicka in en query i form av ett json-dokument som parameter till dessa funktioner.

Genom att använda, och eventuellt kombinera flera, [query-operatorer](https://www.mongodb.com/docs/manual/reference/operator/query/) kan man skriva uttryck motsvarande vad man gör i en WHERE-sats i SQL.

### Update
För att uppdatera dokument i en collection använder man [updateOne()](https://www.mongodb.com/docs/manual/reference/method/db.collection.updateOne/) och [updateMany()](https://www.mongodb.com/docs/manual/reference/method/db.collection.updateMany/).

Första parametern in i dessa funktioner fungerar precis som query-parametern i find() och findOne() och används för att match dokument som ska uppdateras.

Den andra parametern är ett "Update Document" med [update-operatorer](https://www.mongodb.com/docs/manual/reference/operator/update/) som beskriver hur de matchade dokumenten ska uppdateras (till exempel [$set](https://www.mongodb.com/docs/manual/reference/operator/update/set/), [$unset](https://www.mongodb.com/docs/manual/reference/operator/update/unset/), eller [$rename](https://www.mongodb.com/docs/manual/reference/operator/update/rename/))

### Delete
För att ta bort dokument från en collection använder man [deleteOne()](https://www.mongodb.com/docs/manual/reference/method/db.collection.deleteOne/) och [deleteMany()](https://www.mongodb.com/docs/manual/reference/method/db.collection.deleteMany/).

Även dessa tar samma typ av query-dokument som find(), och tar bort alla dokument som matchar query-utrycket.


**Code-along:**  
[001_Query_&_Projection.js](https://github.com/everyloop/NET24-Databases/blob/master/MongoDB/001_Query_%26_Projection.js)  
[002_Update_Operators.js](https://github.com/everyloop/NET24-Databases/blob/master/MongoDB/002_Update_Operators.js)  
