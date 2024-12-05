
using L006_ModelConfiguration.Model;

using var db = new DemoContext();

db.Database.EnsureDeleted();
db.Database.EnsureCreated();

var student = new Student() { FirstName = "Anders", LastName = "Andersson", DateOfBirth = DateOnly.MaxValue };
var anotherStudent = new Student() { FirstName = "Bengt", LastName = "Bengtsson" };

db.Students.Add(student);
db.Students.Add(anotherStudent);

db.SaveChanges();

Console.WriteLine();