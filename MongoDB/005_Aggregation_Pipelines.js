use("sample_mflix");

// db.movies.aggregate([
//     // {$match: {
//     //   year: 2000
//     // }},
//     {$project: {
//       _id: true,
//       title: true,
//       year: true,
//       plot: true,
//       nextYear: {$add: ["$year", 1]},
//       titleWithYear: {$concat: ["$title", " (", {$toString: "$year"}, ")"]},
//       titleWords: {$split: ["$title", " "]},
//       imdbRating: "$imdb.rating"
//     }},
//     // {$lookup: {
//     //   from: "comments",
//     //   localField: "_id",
//     //   foreignField: "movie_id",
//     //   as: "comments",
//     //   pipeline: [{$project: {
//     //     _id: false,
//     //     name: true,
//     //     email: true,
//     //     text: true
//     //   }}]
//     // }},
//     {$group: {
//       _id: "$year",
//       NumberOfMovies: {$count: {}},
//       AverageImdbRating: {$avg: "$imdbRating"}  
//     }},
//     {$match: {
//       NumberOfMovies: {$lt: 10},
//     }},
//     {$sort: {
//       AverageImdbRating: -1,
//       _id: 1
//     }},
//     {$skip: 4},
//     // {$limit: 50},
//     // {$count: "myCount"}
//     // {$out: {
//     //   db: 'myDB',
//     //   coll: 'aggregatedMovies'
//     // }}
//     {$merge: {
//       into: { db:"myDB", coll:"aggregatedMovies" },
//     }}
// ]);

//select title, year, year + 1 as 'nextYear' from ..

// En vy i mongo db fungrar på samma sätt som i SQL,
// men defineras av en pipeline istället för en select-sats.
db.createView("myView", "movies", [
  {$project: {
    _id: true,
    title: true,
    year: true,
    plot: true,
    nextYear: {$add: ["$year", 1]},
    titleWithYear: {$concat: ["$title", " (", {$toString: "$year"}, ")"]},
    titleWords: {$split: ["$title", " "]},
    imdbRating: "$imdb.rating"
  }}
])