use("mydb");

//var myCursor = db.myCollection.find({"productName": "Keyboard"});

// Räknar dokument
//myCursor.count();

// Hoppar över, samt begränsar antal dokument.
//myCursor.skip(1).limit(1);

// Sorterings ordning: ASC = 1, DESC = -1
//myCursor.sort({"NumberOfKeys": 1})

// myCursor.sort({"NumberOfKeys": -1, "Price": 1}).forEach(document => {
//     console.log(`Number of keys: ${document.NumberOfKeys}`)
// });

// while (myCursor.hasNext())
// {
//     console.log(myCursor.next()._id);
// }

db.myCollection
    .find({"dimensions": {$exists: true}})
    .map(p => ({
        Name: p.productName,
        Color: p.color,
        Length: p.dimensions.length,
        Width: p.dimensions.width,
        Height: p.dimensions.height,
    }));

