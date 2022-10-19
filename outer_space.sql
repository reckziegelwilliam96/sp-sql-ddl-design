-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL,
   planet_id INTEGER REFERENCES planets
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period FLOAT NOT NULL,
  planet_id INTEGER REFERENCES planets
);

INSERT INTO planets
  (name, galaxy)
VALUES
  ('Earth', 'Milky Way' ),
  ('Mars', 'Milky Way'),
  ('Venus', 'Milky Way'),
  ('Neptune', 'Milky Way'),
  ('Proxima Centauri b', 'Milky Way'),
  ('Gliese 876 b', 'Milky Way');

  INSERT INTO moons
    (name, planet_id)
  VALUES
    ('The Moon', 1),
    ('Phobos', 2),
    ('Deimos', 2),
    ('Naiad', 4),
    ('Thalassa', 4),
    ('Despina', 4),
    ('Galatea', 4),
    ('Larissa', 4),
    ('S/2004 N 1', 4),
    ('Proteus', 4),
    ('Triton', 4),
    ('Nereid', 4),
    ('Halimede', 4),
    ('Sao', 4),
    ('Laomedeia', 4),
    ('Psamathe', 4),
    ('Neso', 4);

    INSERT INTO orbits
     (name, orbital_period, planet_id)
    VALUES
     ('The Sun', 1.00, 1),
     ('The Sun', 1.88, 2),
     ('The Sun', 0.62, 3),
     ('The Sun', 164.8, 4),
     ('Proxima Centauri', 0.03, 5),
     ('Gliese 876', 0.23, 6);