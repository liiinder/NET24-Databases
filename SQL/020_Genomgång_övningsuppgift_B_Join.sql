
declare @playlist varchar(max) = 'Heavy Metal Classic';

select
	g.Name as 'Genre',
	art.Name as 'Artist',
	alb.Title as 'Album',
	t.Name as 'Track',
	format(t.Milliseconds / 60000, '0#') + ':' +  format(t.Milliseconds % 60000 / 1000, '0#') as 'Length',
	--dateadd(MILLISECOND, (t.Milliseconds), '00:00'),
	format(dateadd(millisecond, (t.Milliseconds), '00:00'), 'mm:ss') as 'Length',
	Bytes as 'Size',
	FORMAT(Bytes / POWER(1024.0, 2), 'f1') + ' MiB' AS 'Size',
	concat(FORMAT(CAST(Bytes AS FLOAT) / 1024 / 1024, 'f1'), ' MiB') AS 'Size',
	format(t.Bytes / 1048576.0, '0.0 MiB') as 'Size',
	isnull(Composer, '-') as Composer
	--coalesce(Composer, null, '-')
from 
	music.tracks t
	join music.genres g on g.GenreId = t.GenreId
	join music.albums alb on alb.AlbumId = t.AlbumId
	join music.artists art on art.ArtistId = alb.ArtistId
	join music.playlist_track pt on pt.TrackId = t.TrackId
	join music.playlists p on p.PlaylistId = pt.PlaylistId
where
	p.Name = @playlist


