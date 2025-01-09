
using L011_MongoDB_EFcore.Models;
using L013_RepositoryPattern.Models;

using (var unitOfWork = new UnitOfWork(new MongoDbContext()))
{
    Movie? myMovie = unitOfWork.Movies.Find(m => m.Title == "The Italian").FirstOrDefault();

    if (myMovie is not null)
    {
        Console.WriteLine($"{myMovie.Title} was created {myMovie.Year}");
    }
    else
    {
        Console.WriteLine("Movie not found!");
    }
}