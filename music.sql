-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE track_list
(
  id SERIAL PRIMARY KEY,
  song_title TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title_id INTEGER NOT NULL REFERENCES track_list,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL REFERENCES artists,
  album_id INTEGER NOT NULL REFERENCES albums,
  producer_id INTEGER NOT NULL REFERENCES producers
);

CREATE TABLE artists_song
(
  artist_id INTEGER NOT NULL REFERENCES artists,
  title_id INTEGER NOT NULL REFERENCES track_list
);

CREATE TABLE producers_song
(
  producer_id INTEGER NOT NULL REFERENCES producers,
  title_id INTEGER NOT NULL REFERENCES track_list
);

INSERT INTO track_list
  (song_title)
VALUES
  ('MMMBop'),
  ('Bohemian Rhapsody'),
  ('One Sweet Day'),
  ('Shallow'),
  ('How You Remind Me'),
  ('New York State of Mind'),
  ('Dark Horse'),
  ('Moves Like Jagger'),
  ('Complicated'),
  ('Say My Name');

INSERT INTO artists
  (artist_name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destinys Child');

INSERT INTO albums
  (album_name)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s On The Wall');

INSERT INTO producers
  (producer_name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO songs
  (title_id, duration_in_seconds, release_date, artist_id, album_id, producer_id)
VALUES
  (1, 238, '04-15-1997', 1, 1, 1),
  (1, 238, '04-15-1997', 1, 1, 2),
  (2, 355, '10-31-1975', 2, 2, 3),
  (3, 282, '11-14-1995', 3, 3, 4),
  (3, 282, '11-14-1995', 4, 3, 4),
  (4, 216, '09-27-2018', 5, 4, 5),
  (4, 216, '09-27-2018', 6, 4, 5),
  (5, 223, '08-21-2001', 7, 5, 6),
  (6, 276, '10-20-2009', 8, 6, 7),
  (6, 276, '10-20-2009', 9, 6, 7),
  (7, 215, '12-17-2013', 10, 7, 8),
  (7, 215, '12-17-2013', 10, 7, 9),
  (7, 215, '12-17-2013', 11, 7, 8),
  (7, 215, '12-17-2013', 11, 7, 9),
  (8, 201, '06-21-2011', 12, 8, 10),
  (8, 201, '06-21-2011', 12, 8, 11),
  (8, 201, '06-21-2011', 13, 8, 10),
  (8, 201, '06-21-2011', 13, 8, 11),
  (9, 244, '05-14-2002', 14, 9, 12),
  (10, 240, '11-07-1999', 15, 10, 13);

INSERT INTO artists_song
  (artist_id, title_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 3),
  (5, 4),
  (6, 4),
  (7, 5),
  (8, 6),
  (9, 6),
  (10, 7),
  (11, 7),
  (12, 8),
  (13, 8),
  (14, 9);

INSERT INTO producers_song
  (producer_id, title_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (4, 4),
  (5, 4),
  (6, 5),
  (7, 6),
  (8, 7),
  (9, 7),
  (10, 8),
  (11, 8),
  (12, 9),
  (13, 10);