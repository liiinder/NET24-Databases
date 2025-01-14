use("mydb");

// db.myCats.find();
// db.myCats.findOne();

// db.myCats.find({query}, {projection}, {options});
// query: för att söka efter olika saker Select * From ... Where query
// projection: för att få ut specifika saker Select projection from;

// db.myCats.find({}, { weight : true});
// db.myCats.find({"name": "Bosse"});

// db.myCats.find(
//     { "name": "Bosse" },
//     {
//         "_id": false,
//         "name": true,
//         "weight": true
//     }
// )

// db.myCats.find({"weight": 1.2});

// db.myCats.insertOne({ "name": "Kaj", "color": "Black", "weight": 1.4 });

// db.myCats.updateMany(
//     { "name": "Bosse"},
//     { $set: {"color": "Brownish" }}
// )

// db.myCats.updateOne({ "name": "Kalle" }, { $set: { "food": "Meat" }});
// db.myCats.find({ "name": "Kalle" });

// db.myCats.updateOne(
//     { "name": "Kalle" },
//     { $unset: { "food": "" }}
// )

// // $inc increase + -
// db.myCats.updateOne(
//     { "name": "Kalle" },
//     { $inc: { "weight": -0.1 }}
// )

// // $inc with update many, if it doesnt exist it will add it
// db.myCats.updateMany(
//     {},
//     { $inc: { "weight": 0 }}
// )

// db.myCats.updateMany(
//     { "weight": 0 },
//     { $unset: { "weight": true }}
// )

db.myCats.countDocuments({ "weight": { $exists: true }});

db.myCats.find(
    { "weight": { $exists: true }}
)

// // $mul: multiplication
// db.myCats.updateOne(
//     { "name": "Kalle" },
//     { $mul: { "weight": 1.1 }}
// )


// db.myCats.find();