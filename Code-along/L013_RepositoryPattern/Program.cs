using L013_RepositoryPattern.Models;
using L013_RepositoryPattern.Repository;

using (var unitOfWork = new UnitOfWork(new MovieContext()))
{
    Movie? myMovie = unitOfWork.Movies.Get("573a1391f29313caabcd820b");

    //Movie? myMovie = unitOfWork.Movies.Find(m => m.Title == "The Italian").FirstOrDefault();

    if (myMovie is not null)
    {
        Console.WriteLine($"{myMovie.Title} was created {myMovie.Year}");
    }
    else
    {
        Console.WriteLine("Movie not found!");
    }

    var topMovies = unitOfWork.Movies.GetTopRatedMovies(5, 1997);
}