using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace L013_RepositoryPattern.Models;

internal class MovieContext : DbContext
{
    public DbSet<Movie> Movies { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = "mongodb+srv://fredrik:fredrik@cluster0.9zffbjc.mongodb.net/";
        var collection = "sample_mflix";

        optionsBuilder.UseMongoDB(connectionString, collection);
    }
}
