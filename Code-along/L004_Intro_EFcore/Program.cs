
using L004_Intro_EFcore.Model;
using Microsoft.EntityFrameworkCore;

//EnsureDatabaseIsDeleted();
//EnsureDatabaseIsCreated();

//CreateBlog("myotherblog.com", 3);

var myBlogs = GetBlogs(printSQL: true);

foreach (var blog in myBlogs)
{
    Console.WriteLine($"{blog.Url}, rating: {blog.RatingRenamed}");
}

static void CreateBlog(string url, int rating = 5)
{
    var blog = new Blog() { Url = url, RatingRenamed = rating };

    using var db = new BloggingContext();

    db.Blogs.Add(blog);

    db.SaveChanges();
}

static List<Blog> GetBlogs(string searchString = "", bool printSQL = false)
{
    using var db = new BloggingContext();

    var query = db.Blogs.Where(b => b.Url.Contains(searchString)).OrderByDescending(b => b.RatingRenamed).ThenBy(b => b.Url);
    
    if (printSQL)
    {
        Console.WriteLine(query.ToQueryString());
        Console.WriteLine();
    }

    return query.ToList();
}

static List<Post> GetAllPosts()
{
    using var db = new BloggingContext();
    return db.Posts.ToList();
}
static void EnsureDatabaseIsCreated()
{ 
    using var db = new BloggingContext();
    
    db.Database.EnsureCreated();
}

static void EnsureDatabaseIsDeleted()
{
    using var db = new BloggingContext();

    db.Database.EnsureDeleted();
}
