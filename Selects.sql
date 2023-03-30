--Название и год выхода альбомов, вышедших в 2018 году.
select a.album_name, a.release_date  
from albums a 
where 
a.release_date >= '2018-01-01' and 
a.release_date  <= '2018-12-31';

--Название и продолжительность самого длительного трека
select s.song_name, s.lasting  from songs s order by s.lasting desc limit 1;

--Название треков, продолжительность которых не менее 3,5 минут.
select s.song_name from songs s where s.lasting >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select c.collection_name  
from collections c 
where 
c.release_date >= '2018-01-01' and 
c.release_date  <= '2020-12-31';

--Исполнители, чьё имя состоит из одного слова
select s.singer_name  from singers s where s.singer_name  !~ ' ';
--Или так
select s.singer_name  from singers s where s.singer_name  !~ '[\u0020]';

--Название треков, которые содержат слово «мой» или «my»
select s.song_name  from songs s where s.song_name like '%my%'