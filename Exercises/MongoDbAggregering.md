# Övningsuppgifter med aggregering i MongoDB

Använd MongoDB Atlas, och sätt upp en server i en molntjänst t.ex Azure.
Ladda in Atlas sample dataset, och connecta till servern från mongo Shell för att
göra uppgifterna nedan.

Använd dig gärna av MongoDB Compass Community för
att underlätta när du kollar igenom större dokument.


**Använd dig av kollektionen listingsAndReviews i databasen sample_airbnb:**

1. Ta ut (projicera) attributen name, price, och listing_url för de dokument
med property_type: ”House” och som har följande amenities:
"Pool", "Air conditioning", ”BBQ grill" och ”Gym”.

**Använd dig av kollektionen movies i databasen sample_mflix:**

2. Räkna antalet filmer där Drew Barrymore spelar mot Adam Sandler.

3. Gruppera på attribut ”rated”, räkna antal filmer i varje grupp och sortera
efter antal i fallande ordning (högst antal först).

4. Ta fram antalet filmer med Harrison Ford, och det lägsta, det högsta, samt
genomsnittliga betyget bland dessa filmer på IMDB.

**Använd dig av kollektionen sales i databasen sample_supplies:**

5. Skapa en vy (view) med namn satisfaction som visar genomsnittlig
satisfaction per gender och purchaseMethod. 