# December 11 & 12

Idag, och imorgon, bygger jag ett demoprojekt som utgår från tabellerna med schemaname "company" i everyloop-databasen.

Detta projekt är uppdelat i 3 separata c#-projekt enligt "multi-lager arkitektur" som är vanligt inom mjukvaruutveckling.

**Code-along:**  
[CompanyDemo.Domain](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/CompanyDemo.Domain)
[CompanyDemo.Infrastructure](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/CompanyDemo.Infrastructure)
[CompanyDemo.Presentation](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/CompanyDemo.Presentation)

Idag sätter vi upp projekten, installerar paket, kör database scaffolding, konfigurerar vår DbContext, kollar på hur vi kan lagra vår connection string med hjälp av user secrets, och börjar koda ett MainWindow med en DataGrid för att visa ordrar.

I morgon, bygger vi vidare på appen med funktionalitet för att välja ordrar och visa orderdetaljer i ett nytt fönster.



