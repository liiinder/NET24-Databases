using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.EntityFrameworkCore;

namespace L011_MongoDB_EFcore.Models;

internal class MongoDbContext : DbContext
{
    public DbSet<Movie> Movies { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = "mongodb+srv://fredrik:fredrik@cluster0.9zffbjc.mongodb.net/";
        var collection = "sample_mflix";

        optionsBuilder.UseMongoDB(connectionString, collection);
    }    
}

[Collection("movies")]
class Movie()
{
    //[BsonId]
    public ObjectId Id { get; set; }

    [BsonElement("title")]
    public string Title { get; set; }

    [BsonElement("year")]
    public int Year { get; set; }

    [BsonElement("imdb")]
    public IMDB IMDB { get; set; }

    [BsonIgnore]
    public string UnmappedProperty { get; set; }
}

class IMDB
{
    [BsonElement("rating")]
    public double Rating { get; set; }

    [BsonElement("votes")]
    public int Votes { get; set; }

    [BsonElement("id")]
    public int Id { get; set; }
}