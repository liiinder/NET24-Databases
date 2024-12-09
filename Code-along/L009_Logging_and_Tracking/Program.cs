

//int x = 5;
//int y = 12;
//Console.WriteLine(x.ToString("B8"));
//Console.WriteLine(y.ToString("B8"));
//Console.WriteLine((x | y).ToString("B8"));

//using L009_Logging_and_Tracking.Model;

//using var db = new DemoContext();

//db.Database.EnsureDeleted();
//db.Database.EnsureCreated();


//Option option = Option.OptionB | Option.OptionD;

Console.WriteLine(((int)(Option.OptionB)).ToString("B8"));
Console.WriteLine(((int)(Option.OptionD)).ToString("B8"));
Console.WriteLine(((int)(Option.OptionB | Option.OptionD)).ToString("B8"));

enum Option { OptionA = 1, OptionB = 2, OptionC = 4, OptionD = 8 }


