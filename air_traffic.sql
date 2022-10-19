-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airlinename TEXT NOT NULL
);

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_name TEXT NOT NULL
);

CREATE TABLE schedule
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines,
  from_city INTEGER NOT NULL REFERENCES locations,
  to_city INTEGER NOT NULL REFERENCES locations
);


CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat_number TEXT NOT NULL
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER NOT NULL REFERENCES passengers,
  flight_id INTEGER NOT NULL REFERENCES schedule
);

INSERT INTO airlines
  (airlinename)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brazil');

INSERT INTO locations
  (city_name, country_name)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Seattle', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablance', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('Charlotte', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO schedule
  (departure, arrival, airline_id, from_city, to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 7, 8),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 9, 10),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 11, 12),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 13, 14),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 15, 16),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 5, 17, 18),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 19, 20);

INSERT INTO passengers
  (first_name, last_name, seat_number)
VALUES
  ('Jennifer', 'Finch', '33B'),
  ('Thadeus', 'Gathercoal', '8A'),
  ('Sonja', 'Pauley', '12F'),
  ('Jennifer', 'Finch', '20A'),
  ('Waneta', 'Skeleton', '23D'),
  ('Thadeus', 'Gathercoal', '18C'),
  ('Berkie', 'Wycliff', '9E'),
  ('Alvin', 'Leathes', '1A'),
  ('Berkie', 'Wycliff', '32B'),
  ('Cory', 'Squibbes', '10D');

INSERT INTO flight
  (passenger_id, flight_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

--Airline, from_city TEXT NOT NULL, from_country TEXT NOT NULL, to_city TEXT NOT NULL, to_country TEXT NOT NULL--
--1 'United', 'Washington DC', 'United States', 'Seattle', 'United States'--
--2 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'--
--3 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States' --
--4 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'
--5 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'--
--6 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'--
--7 'United', 'New York', 'United States', 'Charlotte', 'United States'--
--8 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'--
--9 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'--
--10 'Avianca Brazil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile'--