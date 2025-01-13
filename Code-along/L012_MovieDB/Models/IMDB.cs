using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace MovieDB.Models;

public class IMDB
{
    [BsonElement("rating")]
    public double Rating { get; set; }
    [BsonElement("votes")]
    public int Votes { get; set; }
    [BsonElement("id")]
    public int Id { get; set; }
}
