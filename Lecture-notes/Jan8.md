# Januari 8

## MongoDB Atlas

Vi skapade varsitt konto i MongoDB's molntjänst [Atlas](https://www.mongodb.com/atlas), satte upp ett gratis kluster och laddade in några av deras sample collections.

## Cursor Methods
En cursor är en pekare till resultatet från en query. Istället för att skicka resultatet direkt tillbaka till klienten så skickas istället en cursor som klienten kan använda för att iterera över datasetet. Det är framförallt för att undvika att stora mängder data skickas över nätverket i onödan.

Det finns även ett antal operationer som kan utföras på en cursor, till exempel för att sortera eller ytterligare filtrera resultatet. 

Dessa metoder hittar du [här!](https://www.mongodb.com/docs/manual/reference/method/js-cursor/)

**Code-along:**  
[004_Cursor_Methods..js](https://github.com/everyloop/NET24-Databases/blob/master/MongoDB/004_Cursor_Methods.js)  

## Aggregation Pipeline

Aggregering i MongoDB gör med hjälp av en [pipeline](https://www.mongodb.com/docs/manual/core/aggregation-pipeline/) beståendes av ett eller flera steg som processar data. Utdata från varje steg används som indata till nästa steg.

Några vanliga steg som används är till exempel de för filtrering, projecering och gruppering. 

Läs mer om de olika aggregeringsstegen [här!](https://www.mongodb.com/docs/manual/reference/operator/aggregation-pipeline/)

Det finns även en stor uppsättning operatorer som används ihop med de olika aggregeringsstegen. Dessa motsvarar de funktioner vi hittar i t.ex SQL (eller C#) för stränghantering, aritmetik, datum & tid etc.

Du hittar aggregeringsoperatorerna [här!](https://www.mongodb.com/docs/manual/reference/operator/aggregation/)

**Code-along:**  
[005_Aggregation_Pipelines..js](https://github.com/everyloop/NET24-Databases/blob/master/MongoDB/005_Aggregation_Pipelines.js)  

## Views

Precis som i SQL Server kan man i MongoDB sätta upp views. I MongoDB defineras en view genom en aggregation pipleine istället för, som i SQL, en select sats. 

I övrigt är idén samma; den fungerar som en "collection", men har ingen egen data, utan sammanställer denna från en eller flera andra collections med hjälp av en pipeline.

En view skapas med kommandot: [db.createView()](https://www.mongodb.com/docs/manual/reference/method/db.createView/#mongodb-method-db.createView)

**Code-along:**  
[005_Aggregation_Pipelines..js](https://github.com/everyloop/NET24-Databases/blob/master/MongoDB/005_Aggregation_Pipelines.js)  
