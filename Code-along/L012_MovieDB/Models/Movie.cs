using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using MongoDB.EntityFrameworkCore;

namespace MovieDB.Models;

[Collection("movies")]
public class Movie
{
    [BsonId]
    public ObjectId Id { get; set; }

    [BsonElement("title")]
    public String Title { get; set; }

    //[BsonIgnore]
    [BsonElement("year")]
    public int Year { get; set; }

    [BsonElement("runtime")]
    public int? Length { get; set; }

    [BsonElement("fullplot")]
    public string? Plot { get; set; }

    [BsonElement("genres")]
    public string[]? Genres { get; set; }

    [BsonElement("imdb")]
    public IMDB? IMDB { get; set; }

}
