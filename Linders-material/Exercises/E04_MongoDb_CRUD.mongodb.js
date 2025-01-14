// 1. Använd en databas med namn myDB.
use("mydb");
db.authors.drop();



// 2. Skapa ett dokument med innehåll FirstName: ”Selma”, LastName: Lagerlöf
// och sätt in det i en kollektion med namn ”authors”.
// 3. Lägg till ytterligare ett dokument i ”authors” med FirstName: ”August”,
// LastName: ”Bondeson”, Birth: 1854
db.authors.insertMany(
[{
        FirstName: "Selma",
        LastName: "Lagerlöf"
    },
    {
        FirstName: "August",
        LastName: "Bondeson",
        Birth: 1854
    }
]);



// 4. Uppdatera dokumentet för August Bondeson och lägg till Death: 1906 
db.authors.updateOne(
    { FirstName: "August" },
    { $set: { Death: 1906 }}
)



db.authors.find();

// 5. Lägg till ytterligare författare i ”authors” genom att 
// Ladda ner [addAuthors.js](./addAuthors.js) och kör kommandot load(”addAuthors.js”)
// från mongo Shell. Alternativt öppna den filen och copy/pasta innehållet i mongosh.

// starta scriptet som öppnar mongosh i denna mappen sen
// kör raderna för att ladda denna och den andra filen.