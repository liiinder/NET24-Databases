

using L011_MongoDB_EFcore.Models;

using (var db = new MongoDbContext())
{
    var myMovie = db.Movies.FirstOrDefault();

    Console.WriteLine(myMovie.Title);

    //myMovie.Title += "_X";

    //db.SaveChanges();
}