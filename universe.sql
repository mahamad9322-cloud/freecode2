-- Create universe database
CREATE DATABASE universe;

-- Connect to the universe database
\c universe;

-- Create galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  diameter_in_million_light_years INT,
  galaxy_type VARCHAR(50),
  description TEXT,
  number_of_stars NUMERIC(20, 0)
);

-- Create star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  galaxy_id INT NOT NULL,
  distance_from_earth_in_million_km NUMERIC(10, 2),
  age_in_million_years INT,
  is_spherical BOOLEAN NOT NULL,
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Create planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  star_id INT NOT NULL,
  diameter_in_km INT,
  distance_from_star_in_million_km NUMERIC(10, 2),
  has_life BOOLEAN NOT NULL,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

-- Create moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  planet_id INT NOT NULL,
  diameter_in_km INT,
  is_spherical BOOLEAN,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

-- Create constellation table (5th table)
CREATE TABLE constellation (
  constellation_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  star_id INT,
  number_of_stars INT,
  visibility_in_northern_hemisphere BOOLEAN,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

-- Insert data into galaxy table
INSERT INTO galaxy (name, diameter_in_million_light_years, galaxy_type, description, number_of_stars) VALUES
('Milky Way', 100, 'Spiral', 'Our home galaxy containing the Solar System', 100000000000),
('Andromeda', 220, 'Spiral', 'Nearest major galaxy to the Milky Way', 1000000000000),
('Triangulum', 50, 'Spiral', 'Third largest galaxy in the Local Group', 40000000000),
('Centaurus A', 160, 'Elliptical', 'A giant elliptical galaxy with active nucleus', 100000000000),
('Whirlpool', 76, 'Spiral', 'A classic spiral galaxy with prominent dust lanes', 100000000000),
('Sombrero', 50, 'Spiral', 'Distinctive edge-on spiral galaxy with dark dust band', 800000000000);

-- Insert data into star table
INSERT INTO star (name, galaxy_id, distance_from_earth_in_million_km, age_in_million_years, is_spherical) VALUES
('Sun', 1, 150, 4600, true),
('Sirius', 1, 850, 250, true),
('Vega', 1, 2600, 455, true),
('Betelgeuse', 1, 64400, 10, true),
('Alphard', 1, 21800, 320, true),
('Deneb', 1, 21600, 10, true),
('Altair', 1, 5200, 1200, true),
('Polaris', 1, 13300, 70, true);

-- Insert data into planet table
INSERT INTO planet (name, star_id, diameter_in_km, distance_from_star_in_million_km, has_life) VALUES
('Mercury', 1, 3839, 57.9, false),
('Venus', 1, 12104, 108.2, false),
('Earth', 1, 12756, 149.6, true),
('Mars', 1, 6794, 227.9, false),
('Jupiter', 1, 139820, 778.5, false),
('Saturn', 1, 116460, 1434, false),
('Kepler-452b', 2, 14500, 430, true),
('TRAPPIST-1e', 3, 11800, 11, true),
('Epsilon Eridani b', 4, 8000, 3.4, false),
('Tau Ceti e', 5, 5900, 73, false),
('Proxima Centauri b', 6, 12400, 7.5, true),
('Sirius b companion', 7, 4200, 19, false);

-- Insert data into moon table
INSERT INTO moon (name, planet_id, diameter_in_km, is_spherical) VALUES
('Moon', 3, 3474, true),
('Phobos', 4, 22, false),
('Deimos', 4, 13, false),
('Io', 5, 3660, true),
('Europa', 5, 3122, true),
('Ganymede', 5, 5268, true),
('Callisto', 5, 4821, true),
('Titan', 6, 5150, true),
('Triton', 6, 2707, true),
('Enceladus', 6, 504, true),
('Rhea', 6, 1527, true),
('Ariel', 6, 1158, true),
('Umbriel', 6, 1169, true),
('Oberon', 6, 1523, true),
('Titania', 6, 1578, true),
('Miranda', 6, 471, false),
('Mimas', 6, 396, true),
('Iapetus', 6, 1469, true),
('Dione', 6, 1123, true),
('Tethys', 6, 1062, true);

-- Insert data into constellation table
INSERT INTO constellation (name, star_id, number_of_stars, visibility_in_northern_hemisphere) VALUES
('Orion', 4, 7, true),
('Canis Major', 2, 8, true),
('Lyra', 3, 5, true),
('Aquila', 7, 7, true),
('Ursa Minor', 8, 7, true),
('Centaurus', 5, 11, false);
