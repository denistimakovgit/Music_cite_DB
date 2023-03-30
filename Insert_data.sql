--Добавим 8 исполнителей
insert into singers(singer_id, singer_name)
values
(1, 'DMX'),
(2, 'Eminem'),
(3, '50 Cent'),
(4, 'Snoop Dogg'),
(5, 'Boney M.'),
(6, 'Franc Sinatra'),
(7, 'Metallica'),
(8, 'Lana Del Rey'),
(9, 'Travis Scott'),
(10, 'Drake');

--Добавим 5 жанров
insert into genres(genre_id, genre_name)
values
(1, 'Hip-hop'),
(2, 'Pop music'),
(3, 'Jazz'),
(4, 'Disco'),
(5, 'Rock music');

--Добавим не менее 8 альбомов
insert into albums(album_id, album_name, release_date)
values 
(1, 'Grand Champ', '2003-01-01'),
(2, 'The Definition Of X: Pick Of The Litter', '2007-01-01'),
(3, 'The Eminem Show', '2002-01-01'),
(4, 'Encore (Deluxe Version)', '2020-03-22'),
(5, 'Window Shopper', '2005-11-18'),
(6, 'Curtis', '2007-01-01'),
(7, 'Young, Wild & Free (feat. Bruno Mars)', '2011-11-11'),
(8, 'Doggumentary', '2011-03-23'),
(9, 'Daddy Cool', '1976-08-01'),
(10, 'Fantastic Boney M.', '1984-12-02'),
(11, 'A Jolly Christmas from Frank Sinatra', '1957-09-21'),
(12, 'Metallica', '1991-01-01'),
(13, 'Lust for Life', '2017-07-20'),
(14, 'Scorpion', '2018-06-29'),
(15, 'ASTROWORLD', '2018-08-03');

--свяжем данные в таблицах singers и genres
insert into genressingers (genre_id, singer_id)
values
(1,1),
(1,2),
(1,3),
(1,4),
(1, 9),
(1, 10),
(2,8),
(3,6),
(4,5),
(5,7);

--свяжем данные в таблицах singers и albums
insert into singersalbums (singer_id, album_id)
values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(7, 12),
(8, 13),
(9, 14),
(10, 15);

--Добавим не менее 15 трэков
insert into songs (song_id, song_name, album_id, lasting)
values
(1, 'Love', 13, 272),
(2, 'Lust for Life', 13, 264),
(3, '13 Beaches', 13, 295),
(4, 'Cherry', 13, 180),
(5, 'White Mustang', 13, 164),
(6, 'Summer Bummer', 13, 260),
(7, 'Groupie Love', 13, 264),
(8, 'In My Feelings', 13, 238),
(9, 'Coachella – Woodstock in My Mind', 13, 258),
(10, 'God Bless America – And All the Beautiful Women in It', 13, 276),
(11, 'When the World Was at War We Kept Dancing', 13, 275),
(12, 'Beautiful People Beautiful Problems', 13, 253),
(13, 'Tomorrow Never Came', 13, 307),
(14, 'Heroin', 13, 355),
(15, 'Change', 13, 321),
(16, 'Sad but True', 12, 323),
(17, 'Holier Than Thou', 12, 207),
(18, 'The Unforgiven', 12, 386),
(19, 'Dogs Out', 1, 243),
(20, 'Get It On The Floor', 1, 262),
(21, 'Puppy Love', 4, 220),
(22, 'Im Ya Dogg', 4, 234),
(23, 'Rain Man', 2, 304),
(24, 'Crazy In Love', 2, 258),
(25, 'I Get Money', 3, 258),
(26, 'Fire', 3, 307),
(27, 'Daddy Cool', 5, 243),
(28, 'its my life', 5, 270),
(29, 'Nice for What', 14, 456),
(30, 'ASTROTHUNDER', 15, 446);

--добавим 8 сборников
insert into collections (collection_id, collection_name, release_date)
values
(1, 'Grand Collection', '2015-01-08'),
(2, 'Hip-hop from old school', '2001-12-08'),
(3, 'Pop and Disco', '2016-02-18'),
(4, 'Jazz only', '2019-01-08'),
(5, 'Hip-hop and Pop Music', '2020-10-08'),
(6, 'Rock music', '2013-03-05'),
(7, 'Pop in the air', '2020-10-01'),
(8, 'Disco 80 legends', '2000-10-02');

--соеденим данные в таблицах collections и songs
insert into collectionssongs (collection_id, song_ig)
values 
(1, 22),
(1, 23),
(1, 24),
(1, 26),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(3, 1),
(3, 2),
(3, 3),
(3, 27),
(3, 28),
(4, 2),
(4, 3),
(5, 1),
(5, 6),
(5, 7),
(5, 25),
(5, 26),
(5, 29),
(5, 30),
(6, 17),
(6, 18),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(8, 27),
(8, 28);
