--Количество исполнителей в каждом жанре
select 
	genre_id as Жанр, 
	count(singer_id) as Количество_исполнителей
from genressingers
group by genre_id;

--Количество треков, вошедших в альбомы 2019–2021 годов.
select 
	a.album_id, 
	a.album_name, 
	count(s.song_id) as Количество_трэков  
from albums a
inner join songs s
on a.album_id  = s.album_id 
where  
	a.release_date >= '2019-01-01' and 
	a.release_date <= '2021-01-01'
group by a.album_id, a.album_name ;

--Средняя продолжительность треков по каждому альбому.
SELECT 
	a.album_id, 
	a.album_name, 
	ROUND(AVG(s.lasting), 2) AS Средняя_продолжительность  
FROM albums a
INNER JOIN songs s
ON a.album_id  = s.album_id 
GROUP BY a.album_id, a.album_name;

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT s2.singer_name  FROM songs s
INNER JOIN singersalbums s1
ON s.album_id  = s1.album_id 
INNER JOIN singers s2 
ON s1.singer_id = s2.singer_id 
WHERE s.album_id IN
	(SELECT a.album_id  FROM albums a
	WHERE date_part('year', a.release_date) != 2020)
GROUP BY s2.singer_name;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.collection_name
FROM collections c
	INNER JOIN collectionssongs c2 
		ON c.collection_id = c2.collection_id 
	INNER JOIN songs s
		ON c2.song_ig = s.song_id 
	INNER JOIN albums a
		ON s.album_id = a.album_id 
	INNER JOIN singersalbums s2 
		ON a.album_id = s2.singer_id 
	INNER JOIN singers s3 
		ON s2.singer_id = s3.singer_id 
WHERE s3.singer_name LIKE '%Eminem%'
GROUP BY c.collection_name;

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT a.album_name  
FROM albums a
INNER JOIN singersalbums s 
ON a.album_id  = s.album_id 
INNER JOIN singers s2 
ON s.singer_id = s2.singer_id 
INNER JOIN genressingers g  
ON s2.singer_id = g.singer_id
GROUP BY a.album_name
HAVING COUNT(g.genre_id) > 1;

--Наименования треков, которые не входят в сборники.
SELECT s.song_name 
FROM songs s 
WHERE s.song_id not in 
(SELECT c.song_id FROM collectionssongs c GROUP BY c.song_id);

--Исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s3.singer_name FROM songs s
INNER JOIN albums a 
ON s.album_id = a.album_id 
INNER JOIN singersalbums s2 
ON a.album_id = s2.album_id 
INNER JOIN singers s3 
ON s2.singer_id = s3.singer_id 
WHERE s.lasting = (SELECT MIN(s.lasting) FROM songs s)
GROUP BY s3.singer_name;

--Названия альбомов, содержащих наименьшее количество треков.
CREATE TEMP TABLE temp_table AS
	SELECT s.album_id, COUNT(s.song_name) AS count_of_songs FROM songs s
	GROUP BY s.album_id
	ORDER BY s.album_id;

SELECT a.album_name FROM temp_table t
INNER JOIN albums a 
ON t.album_id = a.album_id 
WHERE t.count_of_songs = (SELECT MIN(t.count_of_songs) FROM temp_table t)albums a2 
GROUP BY a.album_name;
