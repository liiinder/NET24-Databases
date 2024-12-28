# December 9

**Code-along:**  
[L009_Logging_and_Tracking](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L009_Logging_and_Tracking)

## Logging

Simple Logging kan användas för att enkelt logga (till fil eller console) de operationer som EF core utför, vilket är användbart vid utveckling och felsökning för att förstå vad som händer.

[Läs mer hur detta konfigureras här!](https://learn.microsoft.com/en-us/ef/core/logging-events-diagnostics/simple-logging)

## Change tracking

Varje instans av en DbContext "trackar" (håller reda på) de förändring som gjorts mot de inlästa entiteterna. Denna information används för att räkna ut vilka operationer som behöver göras mot databasen när .SaveChanges() anropas.

[Läs mer här!](https://learn.microsoft.com/sv-se/ef/core/change-tracking/)

## Connected vs Disconnected scenarios

Change tracking sker alltså per instans av DbContext, och används när förändringar av inläst data skrivs till databasen inom en instans (av DbContext) livstid. Detta kallas "Connected Scenario".

Många gånger hålls dock inläst data, i form av c#-objekt, kvar i minnet även efter det att en DbContext gått "out of scope". Förändring av data i dessa objekt måste då skrivas mot databasen genom en ny instans av en DbContext. I detta så kallade "Disconnected Scenario", så känner inte den nya instansen till vilka förändring som gjorts eftersom instansens "change tracker" inte följt datat från början (när det först lästes in). Man måste då hantera detta på ett annat sätt.

[Läs mer om detta här!](https://dev.to/christianaugustyn/entity-framework-core-connected-vs-disconnected-3dk7)