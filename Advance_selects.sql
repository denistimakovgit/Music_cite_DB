--Количество исполнителей в каждом жанре
select 
	genre_id as Жанр, 
	count(singer_id) as Количество_исполнителей
from genressingers
group by genre_id;

--Количество треков, вошедших в альбомы 2019–2021 годов.
select 
	count(s.song_id) as Количество_трэков  
from albums a
inner join songs s
on a.album_id  = s.album_id 
WHERE  
	a.release_date BETWEEN  '2019-01-01' and '2021-01-01' ;


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
SELECT s.singer_name/* Получаем имена исполнителей */
FROM singers s  /* Из таблицы исполнителей */
WHERE s.singer_id NOT IN ( /* Где имя исполнителя не входит в вложенную выборку */
    SELECT s.singer_id  /* Получаем имена исполнителей */
    FROM singers s /* Из таблицы исполнителей */
    JOIN singersalbums sa ON s.singer_id  = sa.singer_id  /* Объединяем с промежуточной таблицей */
    JOIN albums a  ON sa.album_id  = a.album_id  /* Объединяем с таблицей альбомов */
    WHERE date_part('year', a.release_date) = 2020 /* Где год альбома равен 2020 */
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT distinct (c.collection_name)
FROM collections c
	INNER JOIN collectionssongs c2 
		ON c.collection_id = c2.collection_id 
	INNER JOIN songs s
		ON c2.song_id = s.song_id 
	INNER JOIN albums a
		ON s.album_id = a.album_id 
	INNER JOIN singersalbums s2 
		ON a.album_id = s2.singer_id 
	INNER JOIN singers s3 
		ON s2.singer_id = s3.singer_id 
WHERE s3.singer_name LIKE '%Eminem%';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT (a.album_name) /* Получаем ТОЛЬКО уникальные имена альбомов. Другие данные в выводе не нужны */
FROM albums a  /* Из таблицы альбомов */
JOIN singersalbums sa ON a.album_id  = sa.album_id  /* Объединяем альбомы с промежуточной таблицей между исполнителями */
JOIN singers s ON sa.singer_id  = s.singer_id /* Объединяем промежуточную таблицу с исполнителями */
JOIN genressingers g ON s.singer_id  = g.singer_id  /* Объединяем исполнителей с промежуточной таблицей между жанрами */
GROUP BY a.album_name , g.singer_id  /* Группируем по именам альбомов и айди исполнителей из промежуточной таблицы между жанрами и исполнителями */
HAVING COUNT(g.genre_id) > 1; /* Где количество id жанров из промежуточной таблицы больше 1 */

--Наименования треков, которые не входят в сборники.
SELECT s.song_name FROM songs s /* Имена треков из таблицы треков */
LEFT JOIN collectionssongs cs ON s.song_id  = cs.song_id /* Делаем левый джойн с промежуточной таблицей между треками и сборниками */
WHERE cs.song_id is NULL; /* Где id трека из промежуточной таблицы является NULL */

--Исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s3.singer_name FROM songs s
INNER JOIN albums a 
ON s.album_id = a.album_id 
INNER JOIN singersalbums s2 
ON a.album_id = s2.album_id 
INNER JOIN singers s3 
ON s2.singer_id = s3.singer_id 
WHERE s.lasting = (SELECT MIN(s.lasting) FROM songs s);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_name /* Названия альбомов */
FROM albums a JOIN songs s ON a.album_id  = s.album_id  /* Объединяем альбомы и треки */
GROUP BY a.album_id  /* Группируем по айди альбомов */
HAVING COUNT(s.song_id) = ( /* Где количество треков равно вложенному запросу, в котором получаем наименьшее количество треков в одном альбоме */
    SELECT COUNT(s.song_id) FROM songs s /* Получаем поличество айди треков из таблицы треков*/
    GROUP BY s.album_id  /* Группируем по айди альбомов */
    ORDER BY 1 /* Сортируем по первому столбцу */
    LIMIT 1 /* Получаем первую запись */
);
