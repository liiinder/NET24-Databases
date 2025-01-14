use("mydb");
// 6. Räkna hur många dokument det finns totalt i ”authors”.
db.authors.countDocuments(); // 6 st



// 7. Räkna hur många författare som heter August i förnamn.
db.authors.countDocuments({ FirstName: "August" }); // 2 st



// 8. Lägg till Birth: 1858 och Death: 1940 för Selma Lagerlöf
db.authors.updateOne(
    { FirstName: "Selma", LastName: "Lagerlöf" },
    { $set: { Birth: 1858, Death: 1940 }}
)



// 9. Lägg till en array ”Books” för Selma Lagerlöf med följande böcker:
//      ”Gösta Berlings saga”,
//      ”En herrgårdssägen”,
//      ”Nils Holgerssons underbara resa genom Sverige”
db.authors.updateOne(
    { FirstName: "Selma", LastName: "Lagerlöf" },
    { $set: { Books: [
        "Gösta Berglings saga",
        "En herrgårdssägen",
        "Nils Holgerssons underbara resa genom Sverige"
    ]}}
)



// 10. Lägg till boken ”Vi på Saltkråkan” bland Astrid Lindgrens böcker.
db.authors.updateOne(
    { FirstName: "Astrid" },
    { $push: { Books: "Vi på Saltkråkan" }}
)



// 11. Ta bort boken ”Bröderna Lejonhjärta” från Astrid Lindgrens böcker.
db.authors.updateOne(
    { FirstName: "Astrid" },
    { $pullAll: { Books: [ "Bröderna Lejonhjärta" ] }}
)
// would probably have worked with pop as well because its first...
// db.authors.updateOne(
//     { FirstName: "Astrid" },
//     { $pop: { Books: -1 }}
// )



// 12. Visa dokument för de författare som dog år 2000 eller senare.
db.authors.find({ Death: { $gte: 2000 }})



// 13. Räkna hur många författare som dog på 1940-talet.
db.authors.countDocuments({ Death: { $gte: 1940, $lt: 1950 }}); // 3 st



// 14. Visa endast attributen FirstName, LastName och Death för de författare som dog på 1940-talet.
db.authors.find(
    { Death: { $gte: 1940, $lt: 1950 }}, 
    {
        _id: false,
        FirstName: true,
        LastName: true,
        Death: true
    }
);



// 15. Lägg till Gender: ”Male” i dokument med FirstName = ”Hjalmar”.
db.authors.updateMany(
    { FirstName: "Hjalmar" },
    { $set: { Gender: "Male" }}
)



// 16. Lägg till Gender: ”Female” i dokument där FirstName är Astrid, Karin eller Selma.
db.authors.updateMany(
    { FirstName: { $in: [ "Astrid", "Karin", "Selma" ]}},
    { $set: { Gender: "Female" }}
)



// 17. Ta bort arrayen Books från dokumentet med August Strindberg.
db.authors.updateMany(
    { FirstName: "August", LastName: "Strindberg" },
    { $unset: { Books: true }}
)



// 18. Ta bort dokumenten där FirstName = ”August”.
db.authors.deleteMany({ FirstName: "August" });



db.authors.find();