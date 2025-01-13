

using MongoDB.Bson;
using MongoDB.Bson.IO;

var doc = new BsonDocument {
    { "FirstName", "Fredrik" },
    { "LastName", "Johansson" },
    { "Contacts", new BsonDocument {
        { "Phone", "03298273423" },
        { "Email", "fredrik@gmail.com" }
    } },
    { "List", new BsonArray {
        1,
        5,
        123,
        "Hej",
        2,
        new BsonDocument {
            { "Key", "Value" }
        }
    } }
};

doc.Add("Color", "Blue");

doc.Set("FirstName", "Kalle");
doc["FirstName"] = "Pelle";

doc.Remove("LastName");

var jsonSettings = new JsonWriterSettings { Indent = true };

Console.WriteLine(doc.ToJson(jsonSettings));

//Console.WriteLine($"\nFirstname = {doc["First_Name"]}");

Console.WriteLine();
Console.Write("Enter key: ");
var myKey = Console.ReadLine();

if (doc.TryGetValue(myKey, out BsonValue myValue))
{
    Console.WriteLine($"{myValue.ToString()}");
}
else
{
    Console.WriteLine($"Key '{myKey}' does not exists.");
}

