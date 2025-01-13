using L013_RepositoryPattern.Models;
using MongoDB.Bson;

namespace L013_RepositoryPattern.Repository
{
    internal class MovieRepository : Repository<Movie>, IMovieRepository
    {
        private MovieContext? movieContext => context as MovieContext;
        public MovieRepository(MovieContext context) : base(context)
        {
        }

        public override Movie? Get(int id)
        {
            return null;
        }

        public override Movie? Get(string id)
        {
            return movieContext.Set<Movie>().Find(new ObjectId(id));
        }

        public IEnumerable<Movie>? GetTopRatedMovies(int count, int? year = null)
        {
            var query = movieContext?.Movies.AsQueryable();

            if (year is not null)
            {
                query = query.Where(m => m.Year == year && m.IMDB.Votes > 50000);
            }

            return query?
                .OrderByDescending(m => m.IMDB.Rating)
                .Take(count)
                .ToList();
        }
    }
}
