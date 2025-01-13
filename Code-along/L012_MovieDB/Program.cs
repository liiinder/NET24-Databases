using Microsoft.EntityFrameworkCore;
using MongoDB.Bson;
using System.Text;
using System.Globalization;
using MovieDB.Models;
using MovieDB;
using System.Text.RegularExpressions;

var titles = GetTitles();

Console.Write("Search: ");

ConsoleKeyInfo keyInfo;
string searchString = string.Empty;
int numberOfMatches = 0;
int selectedIndex = -1;

do
{
    keyInfo = Console.ReadKey(true);

    if (IsValidCharacter(keyInfo.KeyChar))
    {
        if (keyInfo.Key == ConsoleKey.Enter) continue;
        Console.Write(keyInfo.KeyChar);
        searchString += keyInfo.KeyChar;
        selectedIndex = -1;
    }
    else if (keyInfo.Key == ConsoleKey.Backspace && searchString.Length > 0)
    {
        searchString = searchString[0..^1];
        Console.CursorLeft--;
        Console.Write(" ");
        Console.CursorLeft--;
        selectedIndex = -1;
    }
    else if (keyInfo.Key == ConsoleKey.DownArrow && selectedIndex < numberOfMatches - 1)
    {
        selectedIndex++;
    }
    else if (keyInfo.Key == ConsoleKey.UpArrow && selectedIndex > 0)
    {
        selectedIndex--;
    }

    numberOfMatches = UpdateSearchResult(titles, searchString, selectedIndex);

} while (keyInfo.Key != ConsoleKey.Escape);

Console.SetCursorPosition(0, 28);

static bool IsValidCharacter(char c)
{
    if (char.IsAsciiLetterOrDigit(c)) return true;
    if (char.IsPunctuation(c)) return true;
    if (char.IsWhiteSpace(c)) return true;
    return false;
}

static List<MovieShortInfo> GetTitles()
{
    using var db = new MovieContext();

    return db.Movies
        .AsNoTracking()
        .Select(m => new MovieShortInfo() { Id = m.Id, Title = m.Title, Year = m.Year })
        //.Take(100)
        .ToList();
}

static void ClearDetailedInformation()
{
    using var cursor = new CursorPosition(0, 15);
    PrintSpaceOnlyLines(numberOfLines: 13);
}


static int UpdateSearchResult(List<MovieShortInfo> titles, string searchString, int selectedIndex = -1)
{
    using var cursor = new CursorPosition(0, 2);

    var matches = titles.Where(t => t.Title.ToLower().Contains(searchString.ToLower()))
        .OrderBy(t => t.Year).ToList();

    if (searchString == "") matches = new List<MovieShortInfo>();

    var matchCount = matches.Count();

    PrintTitleSelection(searchResult: matches, selectedIndex);

    PrintNumberOfAdditionalTitles(totalTitles: matchCount);

    if (selectedIndex >= 0)
    {
        ShowDetailedInformation(movieID: matches[selectedIndex].Id);
    }
    else
    {
        ClearDetailedInformation();
    }

    return matchCount;
}

static void PrintTitleSelection(List<MovieShortInfo> searchResult, int selectedIndex)
{
    var startIndex = selectedIndex > 9 ? selectedIndex - 9 : 0;
    if (startIndex > 0) selectedIndex = 9;

    var displayedTitles = searchResult.Skip(startIndex).Take(10).ToList();

    for (int i = 0; i < displayedTitles.Count(); i++)
    {
        if (i == selectedIndex)
        {
            Console.ForegroundColor = ConsoleColor.Black;
            Console.BackgroundColor = ConsoleColor.Gray;
        }

        Console.WriteLine($"{displayedTitles[i].Title} ({displayedTitles[i].Year})".PadRight(100).Substring(0, 100));
        Console.ResetColor();
    }

    PrintSpaceOnlyLines(numberOfLines: 10 - displayedTitles.Count() + 1);

}

static void PrintSpaceOnlyLines(int numberOfLines, int lineWidth = 100)
{
    for (int i = 0; i < numberOfLines; i++)
    {
        Console.WriteLine(new string(' ', lineWidth));
    }
}

static void PrintNumberOfAdditionalTitles(int totalTitles)
{
    if (totalTitles > 10)
    {
        Console.WriteLine($"+{totalTitles - 10} titles.".PadRight(100));
    }
    else
    {
        Console.WriteLine(new string(' ', 100));
    }
}

static void ShowDetailedInformation(ObjectId movieID)
{
    using var cursor = new CursorPosition(0, 15);
    using var db = new MovieContext();

    var movie = db.Movies.Find(movieID);

    Console.ForegroundColor = ConsoleColor.Yellow;
    Console.WriteLine($"{movie.Title} ({movie.Year})".PadRight(100).Substring(0, 100));

    var provider = new NumberFormatInfo() { NumberDecimalSeparator = "." };
    var genres = string.Join(", ", movie.Genres ?? new[] { "Unknown" });
    var rating = $"{movie.IMDB.Rating.ToString(provider)} ({movie.IMDB.Votes} votes)";

    Console.ForegroundColor = ConsoleColor.DarkGray;
    Console.Write($"Length: {movie.Length} minutes".PadRight(25));
    Console.Write($"IMDB Rating: {rating}".PadRight(35));
    Console.Write($"Genre: {genres}".PadRight(40));

    Console.ForegroundColor = ConsoleColor.DarkGreen;
    Console.WriteLine($"\n\n{InsertLineBreaksAndPadWithSpaces(movie.Plot)}");
}

static string InsertLineBreaksAndPadWithSpaces(string original, int charsPerLine = 100, int numberOfLines = 10)
{
    if (original is null) original = "...";

    string[] words = original.Split(' ');
    StringBuilder builder = new StringBuilder();

    int charsSinceLastBreak = 0;
    int lineCount = 1;

    foreach (var word in words)
    {
        charsSinceLastBreak += word.Length + 1;

        if (charsSinceLastBreak > charsPerLine)
        {
            builder.Append(new string(' ', word.Length + 1 - (charsSinceLastBreak - charsPerLine)));

            if (lineCount >= numberOfLines)
            {
                break;
            }

            builder.Append('\n');
            charsSinceLastBreak = word.Length;
            lineCount++;
        }

        builder.Append(word);
        builder.Append(' ');
    }

    if (charsSinceLastBreak < charsPerLine)
    {
        builder.Append($"{new string(' ', charsPerLine - charsSinceLastBreak)}");
    }

    while (lineCount < numberOfLines)
    {
        builder.Append($"\n{new string(' ', charsPerLine + 1)}");
        lineCount++;
    }

    return builder.ToString();
}
