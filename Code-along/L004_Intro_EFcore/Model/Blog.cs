namespace L004_Intro_EFcore.Model;

public class Blog
{
    public int BlogId { get; set; }
    public string? Url { get; set; }
    public int? RatingRenamed { get; set; }
    public string Author { get; set; }
    public bool IsOnline { get; set; }
    public DateTime CreatedAt { get; set; }
    public List<Post> Posts { get; set; }
}
