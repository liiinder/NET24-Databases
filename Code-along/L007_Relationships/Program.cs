
using L007_Relationships.Model;

using var db = new RelationshipDemoContext();

db.Database.EnsureDeleted();
db.Database.EnsureCreated();

