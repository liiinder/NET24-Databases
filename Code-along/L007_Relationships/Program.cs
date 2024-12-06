
using L007_Relationships.Model;
using Microsoft.EntityFrameworkCore;

using var db = new RelationshipDemoContext();

db.Database.EnsureDeleted();
db.Database.EnsureCreated();

var query = db.Courses.Include(c => c.Students);

var course = query.ToList();

Console.WriteLine(query.ToQueryString());
Console.WriteLine();
