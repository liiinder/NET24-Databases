namespace L009_Logging_and_Tracking.Model;

public class Country
{
    public int Id { get; set; }
    public string Name { get; set; }
    public List<City> Cities { get; set; }
}
