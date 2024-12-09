

using L005_ScaffoldedMusic.Model;
using Microsoft.EntityFrameworkCore;

using var db = new EveryloopContext();

//var genres = db.Genres.ToList();
//var albums = db.Albums.ToList();

//var query = db.Artists.OrderBy(a => a.Name)
//    .Include(artist => artist.Albums.Where(album => album.Tracks.Count > 20));
//    //.Skip(100)
//    //.Take(5);
//    //.ThenInclude(album => album.Artist)
//    //.Include(track => track.Genre);

//Console.WriteLine(query.ToQueryString());

//var artists   = query.ToList();


var albums = db.Albums.ToList();

db.Entry(albums[0]).Collection(a => a.Tracks).Load();

db.Entry(albums[1]).Reference(a => a.Artist).Load();


Console.WriteLine();