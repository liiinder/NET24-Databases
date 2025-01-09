using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace L011_MongoDB_EFcore.Models;

class IMDB
{
    [BsonElement("rating")]
    public double Rating { get; set; }

    [BsonElement("votes")]
    public int Votes { get; set; }

    [BsonElement("id")]
    public int Id { get; set; }
}