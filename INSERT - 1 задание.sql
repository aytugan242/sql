-- insert
-- 4 исполнителей
INSERT INTO Performers (id_performers, name) 
VALUES 
(1, 'Adele'),
(2, 'Ed Sheeran'),
(3, 'Taylor Swift'),
(4, 'Bruno Mars');

-- 3 жанра
INSERT INTO Genres (id_genres, name)
VALUES 
(1, 'Pop'),
(2, 'Rock'),
(3, 'Hip Hop');

-- связь исполнителей с жанрами
INSERT INTO GenresPerformers (id_genres, id_performers)
VALUES 
(1, 2),
(2, 1),
(3, 3),
(3, 4);

-- 3 альбома
INSERT INTO Albums (id_albums, name, year_a)
VALUES 
(1, '21', 2019),
(2, 'круть', 2015),
(3, 'здорово', 2023);

-- связь исполнителей с альбомами
INSERT INTO PerformersAlbums (id_performers, id_albums)
VALUES 
(1, 2),
(2, 1),
(3, 3),
(4, 2);

-- 6 треков
INSERT INTO Tracks (if_tracks, name, duration, id_albums)
VALUES 
(1, 'Rolling in the Deep', 228, 1),
(2, 'Shape of You', 233, 2),
(3, 'Blank Space', 231, 3),
(4, 'Grenade', 223, 1),
(5, 'Bad Blood', 213, 3),
(6, 'my Perfect', 263, 2);

-- 4 сборников
INSERT INTO Collections (id_collections, name, year_c)
VALUES 
(1, 'Greatest Hits', 2019),
(2, 'Today Hits', 2019),
(3, 'Throwback Hits', 2015),
(4, 'Future Hits', 2023);

-- связь сборников с треками
INSERT INTO CollectionsTracks (id_collections, if_tracks)
VALUES 
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(1, 4),
(2, 6);
