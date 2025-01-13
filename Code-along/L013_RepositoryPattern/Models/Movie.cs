using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.EntityFrameworkCore;
using System.Diagnostics;

namespace L013_RepositoryPattern.Models;

[DebuggerDisplay("{Title, nq} ({Year})")]
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
