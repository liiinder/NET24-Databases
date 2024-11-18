USE everyloop

/*
    https://github.com/liiinder/NET24-Databases/blob/master/Exercises/Join.md#b---playlist

    DECLARE @playlist VARCHAR(120) = 'Heavy Metal Classic' -- (music.playlists Name)

    Genre    Artist    Album    Track    Length    Size    Composer
    ---------------------------------------------------------------
    SELECT * FROM music.playlists       -- Name -> playlistID
    SELECT * FROM music.playlist_track  -- playlist_track many to many column
    SELECT * FROM music.tracks          -- tracks/playlist_tracks -> trackId
    SELECT * FROM music.albums          -- track/albums -> AlbumId -> ArtistId
    SELECT * FROM music.artists         -- album/artists -> ArtistId -> Name
    SELECT * FROM music.genres          -- track/genres GenreId -> Name
*/

-- DECLARE @playlist VARCHAR(120) = 'Heavy Metal Classic'
DECLARE @playlist VARCHAR(120) = '90’s Music'

SELECT
    g.Name AS 'Genre',
    ar.Name AS 'Artist',
    al.Title AS 'Album',
    t.Name AS 'Track',
    FORMAT(Milliseconds / 60000, '00') + ':' +
        FORMAT(Milliseconds % 60000 / 1000, '00') AS 'Length',
    CAST(FORMAT(CAST(Bytes AS FLOAT) / 1024 / 1024, 'f1') AS NVARCHAR(100)) + ' MiB' AS 'Size',
    ISNULL(Composer, '-') AS 'Composer'
FROM
    music.playlists p
    JOIN music.playlist_track pt
    ON p.PlaylistId = pt.PlaylistId
    JOIN music.tracks t
    ON t.TrackId = pt.TrackId
    JOIN music.albums al
    ON al.AlbumId = t.AlbumId
    JOIN music.artists ar
    ON al.ArtistId = ar.ArtistId
    JOIN music.genres g
    ON t.GenreId = g.GenreId
WHERE p.Name = @playlist