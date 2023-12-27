CREATE TABLE IF NOT EXISTS Genres (
	id_genres SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers (
	id_performers SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresPerformers (
	id_genres INTEGER REFERENCES Genres(id_genres),
	id_performers INTEGER REFERENCES Performers(id_performers),
	CONSTRAINT pk PRIMARY KEY (id_genres, id_performers)
);


CREATE TABLE IF NOT EXISTS Albums (
	id_albums SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_a integer NOT NULL
);

CREATE TABLE IF NOT EXISTS PerformersAlbums (
	id_performers INTEGER REFERENCES Performers(id_performers),
	id_albums INTEGER REFERENCES Albums(id_albums),
	CONSTRAINT pa PRIMARY KEY (id_performers, id_albums)
);

CREATE TABLE IF NOT EXISTS Tracks (
	if_tracks SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL,
	id_albums INTEGER NOT NULL REFERENCES Albums(id_albums)
);

CREATE TABLE IF NOT EXISTS Collections (
	id_collections SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_c integer NOT NULL
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
	id_collections INTEGER REFERENCES Collections(id_collections),
	if_tracks INTEGER REFERENCES Tracks(if_tracks),
	CONSTRAINT ct PRIMARY KEY (id_collections, if_tracks)
);