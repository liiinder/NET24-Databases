

using L009_Logging_and_Tracking.Model;

//AddCountry("Spain");
UpdateDemo();

static void RecreateDatabase()
{
    using var db = new DemoContext();
    db.Database.EnsureDeleted();
    db.Database.EnsureCreated();
}

static void AddCountry(string name)
{
    using var db = new DemoContext();

    var country = new Country() { Name = name };

    db.Countries.Add(country);

    db.SaveChanges();
}

static void UpdateDemo()
{
    using var db = new DemoContext();

    var countries = db.Countries.ToList();

    Console.WriteLine(db.ChangeTracker.DebugView.LongView);

    countries[0].Name = "Sweden!";
    countries[3].Name = "Spain!";

    db.ChangeTracker.DetectChanges();

    Console.WriteLine("\nTracker status after updates: ");
    Console.WriteLine(db.ChangeTracker.DebugView.LongView);

    db.SaveChanges();

    Console.WriteLine("\nTracker status after save: ");
    Console.WriteLine(db.ChangeTracker.DebugView.LongView);

}