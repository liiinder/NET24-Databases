using Microsoft.EntityFrameworkCore;
using MongoDB.EntityFrameworkCore.Extensions;

namespace MovieDB.Models;

internal class MovieContext : DbContext
{
    public DbSet<Movie> Movies { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseMongoDB("mongodb+srv://fredrik:fredrik@cluster0.9zffbjc.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0", "sample_mflix");
    }


    //protected override void OnModelCreating(ModelBuilder modelBuilder)
    //{
    //    modelBuilder.Entity<Movie>().ToCollection("movies");
    //    modelBuilder.Entity<Movie>().Property(m => m.Title).HasElementName("title");
    //    modelBuilder.Entity<Movie>().Property(m => m.Year).HasElementName("year");
    //    modelBuilder.Entity<Movie>().Property(m => m.Length).HasElementName("runtime");
    //    modelBuilder.Entity<Movie>().Property(m => m.Plot).HasElementName("fullplot");
    //    modelBuilder.Entity<Movie>().Property(m => m.Genres).HasElementName("genres");
    //    //modelBuilder.Entity<Movie>().Property(m => m.IMDB).HasElementName("imdb");

    //}
}
