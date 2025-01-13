

using L010_Sqlite;

//RecreateDatabase();
AddCity("Stockholm", "Sweden");
AddCity("Gothenburg", "Sweden");
AddCity("Malmö", "Sweden");
AddCity("Oslo", "Norway");
AddCity("Bergen", "Norway");

static void AddCity(string cityName, string countryName)
{
    using var db = new SqliteContext();

    if (db.Cities.Any(c => c.Name == cityName && c.Country.Name == countryName)) return;

    var country = db.Countries.FirstOrDefault(c => c.Name == countryName)
        ?? new Country() { Name = countryName };

    var city = new City() { Name = cityName, Country = country };
    
    db.Cities.Add(city);

    db.SaveChanges();
}

static void RecreateDatabase()
{
    using var db = new SqliteContext();
    db.Database.EnsureDeleted();
    db.Database.EnsureCreated();
}

