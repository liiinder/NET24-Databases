using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Security.Principal;

namespace L004_Intro_EFcore.Model;

public class BloggingContext : DbContext
{
    public DbSet<Blog> Blogs { get; set; }
    public DbSet<Post> Posts { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = new SqlConnectionStringBuilder()
        {
            ServerSPN = "localhost",
            InitialCatalog = "BlogDB",
            TrustServerCertificate = true,
            IntegratedSecurity = true
        }.ToString();

        optionsBuilder.UseSqlServer(connectionString);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}

public class Blog
{
    public int BlogId { get; set; }
    public string? Url { get; set; }
    public int? Rating { get; set; }
    public List<Post> Posts { get; set; }
}

public class Post
{
    public int PostId { get; set; }
    public string Topic { get; set; }
    public string Text { get; set; }
}
