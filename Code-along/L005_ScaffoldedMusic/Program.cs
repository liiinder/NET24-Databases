

using L005_ScaffoldedMusic.Model;

using var db = new EveryloopContext();

var artists = db.Artists.Where(a => a.Name.StartsWith("R"));

foreach (var artist in artists)
{
    Console.WriteLine($"{artist.Name}");
}