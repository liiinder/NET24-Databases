
select 
	Name,
	Email	
from
(
	select
		concat(FirstName, ' ', LastName) as 'Name',
		email,
		phone
	from
		users
	where
		FirstName like '[a-d]%'
) subquery
where
	len(name) > 15

SELECT
    FORMAT(
        CAST(
            (SELECT
                COUNT(DISTINCT ProductId)
            FROM company.orders o
                JOIN company.order_details od
                ON o.Id = od.OrderId
            WHERE o.ShipCity LIKE 'London') AS FLOAT)
        / COUNT(*), 'P2') AS 'Andel produkter skickade till London'
FROM company.products p

select 
	o.ShipCity as 'City',
	count(distinct p.ProductName) as 'Unique products ordered',
	Format(cast(count(distinct p.ProductName) as decimal) / 77, 'P') as 'Percentage of products sold to London'
from company.orders o 
	join company.order_details od on o.id = od.OrderId
	join company.products p on p.id = od.ProductId
where ShipCity = 'London'
group by
	o.ShipCity

select 
	o.ShipCity as 'City',
	count(distinct od.ProductId) as 'Unique products ordered',
	Format(cast(count(distinct od.ProductId) as decimal) / (select count(*) from company.products), 'P') as 'Percentage of products sold to London'
from company.orders o 
	join company.order_details od on o.id = od.OrderId
where ShipCity = 'London'
group by
	o.ShipCity

select * from company.orders
select * from company.order_details


-- Vilket är det genomsnittliga antalet artister per spellista?

SELECT 
    FORMAT(AVG(CAST([Unique artists] AS FLOAT)), '00.00') AS [Average unique artists per playlist]
FROM (
    SELECT
        p.PlaylistId,
        COUNT(DISTINCT a.ArtistID) AS [Unique artists]
    FROM
        music.playlists p
    LEFT JOIN music.playlist_track pt
        ON p.PlaylistId = pt.PlaylistId
    LEFT JOIN music.tracks t
        ON t.TrackId = pt.TrackId
    LEFT JOIN music.albums a
        ON t.AlbumId = a.AlbumId
    WHERE 
       p.Name NOT IN ('Music Videos', 'TV Shows', 'Movies', 'Audiobooks')
    GROUP BY
        p.PlaylistId
) AS Subquery;


-- Om den inre queryn använder data från den yttre så behöver den inre exekveras för varje rad i den yttre.
-- D.v.s. Om subqueryn inte går att köra fristående (när man markerar den koden) så blir det långsamt.

select 
	TrackId,
	Name,
	t.AlbumId,
	(select Title from music.albums where AlbumId = t.AlbumId)
from 
	music.tracks t
