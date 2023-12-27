-- Задание 2
-- Название и продолжительность самого длительного трека.
SELECT name, duration
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks)

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration
FROM Tracks
WHERE duration > 3.5 * 60

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM Collections
WHERE year_c >= 2018 and year_c <= 2020

-- Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM Performers
WHERE REGEXP_COUNT(name, ' ') = 0;

-- Название треков, которые содержат слово «мой» или «my».
SELECT name
FROM Tracks
WHERE name LIKE '%мой%' OR name LIKE '%my%'


-- Задание 3
-- Количество исполнителей в каждом жанре.
SELECT Genres.name, COUNT(Performers.id_performers)
FROM Genres
LEFT JOIN GenresPerformers ON Genres.id_genres = GenresPerformers.id_genres
LEFT JOIN Performers ON GenresPerformers.id_performers = Performers.id_performers
GROUP BY Genres.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*)
FROM Tracks
INNER JOIN Albums ON Tracks.id_albums = Albums.id_albums
WHERE Albums.year_a >= 2019 AND Albums.year_a <= 2020;

-- Средняя продолжительность треков по каждому альбому.
SELECT Albums.name, AVG(Tracks.duration)
FROM Tracks
INNER JOIN Albums ON Tracks.id_albums = Albums.id_albums
GROUP BY Tracks.id_albums, Albums.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT Performers.name 
FROM Performers
LEFT JOIN PerformersAlbums ON Performers.id_performers = PerformersAlbums.id_performers
LEFT JOIN Albums ON PerformersAlbums.id_albums = Albums.id_albums
WHERE Albums.year_a != 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT Collections.name
FROM Collections
JOIN CollectionsTracks ON Collections.id_collections = CollectionsTracks.id_collections
JOIN Tracks ON CollectionsTracks.if_tracks = Tracks.if_tracks
JOIN Albums ON Tracks.id_albums = Albums.id_albums
JOIN PerformersAlbums ON Albums.id_albums = PerformersAlbums.id_albums
JOIN Performers ON PerformersAlbums.id_performers = Performers.id_performers
WHERE Performers.name = 'Adele';