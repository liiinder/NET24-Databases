USE everyloop

-- C - Music
-- Med tabellerna från schema “music”, svara på följande frågor:




-- Av alla audiospår, vilken artist har längst total speltid?
-- Vad är den genomsnittliga speltiden på den artistens låtar?

SELECT TOP 1
    ar.Name,
    SUM(t.Milliseconds) as 'Total time in ms',
    COUNT(*) 'tracks',
    FORMAT(SUM(t.Milliseconds) / COUNT(*) / 60000, '00') + ':' +
    FORMAT(SUM(t.Milliseconds) / COUNT(*) % 60000 / 1000, '00') AS 'Avg time per track'
FROM music.tracks t
    JOIN music.albums al
    ON t.AlbumId = al.AlbumId
    JOIN music.artists ar
    ON ar.ArtistId = al.ArtistId
WHERE MediaTypeId NOT LIKE '3'
GROUP BY ar.Name
ORDER BY 'Total time in ms' DESC

/*
    3 different ways to get subsets of the results.
    ------------------------------------------------

TOP can be used as is or with PERCENT after https://www.sqlservertutorial.net/sql-server-basics/sql-server-select-top/
--------------------------------------------------------------------------------------------------------------------------
    SELECT TOP 1 * FROM music.tracks
    SELECT TOP 1 PERCENT * FROM music.tracks


SET ROWCOUNT hardcaps the result that SSMS is getting and will affect all other querys so you need to reset it after.
--------------------------------------------------------------------------------------------------------------------------
    SET ROWCOUNT 1
    SELECT * FROM music.tracks
    SET ROWCOUNT 0


OFFSET is an option for ORDER BY - https://www.sqlservertutorial.net/sql-server-basics/sql-server-offset-fetch/
--------------------------------------------------------------------------------------------------------------------------
    SELECT * FROM music.tracks ORDER BY TrackId
    OFFSET 0 ROWS				-- OFFSET is mandatory
    FETCH NEXT 1 ROW ONLY		-- FETCH is optional   [FIRST / NEXT] and [ROW / ROWS] doesn't matter which as they do the same

    SELECT * FROM music.tracks ORDER BY TrackId
    OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY		-- To get row 11 to 20

*/




-- Vad är den sammanlagda filstorleken för all video?

SELECT
    mt.Name as 'Mediatyp',
    CAST(SUM(CAST(BYTES AS BIGINT)) / POWER(1024, 3) AS NVARCHAR(max)) + ' GiB' AS 'Storlek'
FROM music.tracks t
    JOIN music.media_types mt
    ON t.MediaTypeId = mt.MediaTypeId
WHERE
    mt.Name LIKE '%video%'
GROUP BY mt.Name

-- Kunde skippat join och bara köra rakt på tracks.MediaTypeId = 3
-- men det är ju en uppgift om Join så tog och joinade mot tabellen och sökte efter 'Video' i Namnet...




-- Vilket är det högsta antal artister som finns på en enskild spellista?

SELECT
    pt.PlaylistId AS 'ID',
    MIN(p.Name) AS 'Namn',
    COUNT(DISTINCT al.ArtistId) AS 'Unika artister'
FROM music.playlist_track pt
    JOIN music.tracks t
    ON pt.TrackId = t.TrackId
    JOIN music.albums al
    ON t.AlbumId = al.AlbumId
    JOIN music.playlists p
    ON pt.PlaylistId = p.PlaylistId
GROUP BY pt.PlaylistId
ORDER BY 'Unika artister' DESC




-- Vilket är det genomsnittliga antalet artister per spellista?

DECLARE @sumOfUniqueArtists FLOAT = 0
DECLARE @sumOfPlaylists FLOAT = 0

SELECT
    @sumOfPlaylists += COUNT(DISTINCT p.PlaylistId),
    @sumOfUniqueArtists += COUNT(DISTINCT al.ArtistId)
FROM music.playlist_track pt
    JOIN music.tracks t
    ON pt.TrackId = t.TrackId
    JOIN music.albums al
    ON t.AlbumId = al.AlbumId
    JOIN music.playlists p
    ON pt.PlaylistId = p.PlaylistId
GROUP BY p.PlaylistId

PRINT CAST(@sumOfUniqueArtists / @sumOfPlaylists AS NVARCHAR(max)) + ' genomsnittliga antalet artister per spellista'