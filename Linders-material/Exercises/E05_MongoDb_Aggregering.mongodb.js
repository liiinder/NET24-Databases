// Använd MongoDB Atlas, och sätt upp en server i en molntjänst t.ex Azure.
// Ladda in Atlas sample dataset, och connecta till servern från mongo Shell för att göra uppgifterna nedan.

// Använd dig gärna av MongoDB Compass Community för att underlätta när du kollar igenom större dokument.

// Använd dig av kollektionen listingsAndReviews i databasen sample_airbnb:
// Ta ut (projicera) attributen name, price, och listing_url
//
// för de dokument med property_type: ”House” 
// och som har följande amenities: "Pool", "Air conditioning", ”BBQ grill" och ”Gym”.
// ----------------------------------------------------------------------------------

use("sample_airbnb");
db.listingsAndReviews.find(
    {
        property_type: "House",
        amenities: { $all:
            ["Pool", "Air conditioning", "BBQ grill", "Gym"]} },
        {
            _id: false,
            name: true,
            price: true,
            listing_url: true
        }
);



// Använd dig av kollektionen movies i databasen sample_mflix:
// Räkna antalet filmer där Drew Barrymore spelar mot Adam Sandler.
// ----------------------------------------------------------------

use("sample_mflix");
db.movies.countDocuments(
    {
        cast: { $all:
            ["Drew Barrymore", "Adam Sandler"]
        }
    }
);



// Gruppera på attribut ”rated”, räkna antal filmer i varje grupp
// och sortera efter antal i fallande ordning (högst antal först).
// ----------------------------------------------------------------

use("sample_mflix");
db.movies.aggregate([{ $sortByCount: "$rated" }])




// Ta fram antalet filmer med Harrison Ford,
// och det lägsta, det högsta, samt genomsnittliga betyget bland dessa filmer på IMDB.
// -----------------------------------------------------------------------------------

use("sample_mflix");
db.movies.aggregate([
    {
        $match: { cast: "Harrison Ford"}
    },
    {
        $project:
        {
            _id: false,
            imdbRating: "$imdb.rating"
        }
    },
    {
        $group:
        {
            _id: "Harrison Ford",
            NumberOfMovies: { $count: {}},
            MinRating: { $min: "$imdbRating" },
            MaxRating: { $max: "$imdbRating" },
            AvgRating: { $avg: "$imdbRating" }
        }
    }
]);



// Använd dig av kollektionen sales i databasen sample_supplies:

// Skapa en vy (view) med namn satisfaction som visar genomsnittlig satisfaction per gender och purchaseMethod.

use("sample_supplies");
db.satisfaction.drop();
db.createView(
    "satisfaction",
    "sales",
    [
        {
            $group:
            {
                _id: {
                    gender: "$customer.gender",
                    purchaseMethod: "$purchaseMethod"
                },
                avgsatisfaction: { $avg: "$customer.satisfaction" }
            }
        },
        {
            $project:
            {
                _id: { $concat: ["$_id.gender", ": ", "$_id.purchaseMethod"]},
                avgsatisfaction: { $round: ["$avgsatisfaction", 2]}
            }
        },
        { $sort: { avgsatisfaction : -1 } }
    ]
)

db.satisfaction.find({ });