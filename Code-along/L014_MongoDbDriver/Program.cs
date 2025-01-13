
using MongoDB.Driver;

var connectionString = "mongodb+srv://fredrik:fredrik@cluster0.9zffbjc.mongodb.net/";

var client = new MongoClient(connectionString);

client.ListDatabaseNames().ToList().ForEach(d => Console.WriteLine(d));

var movieCollection = client.GetDatabase("sample_mflix").GetCollection<Movie>("movies");

var filter = Builders<Movie>.Filter.Eq("title", "The Italian");

var myMovie = movieCollection.Find(filter).FirstOrDefault();

Console.WriteLine();