/*Complete the tasks below

    You should create a database named universe

    Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon

    Each table should have a primary key

    Each primary key should automatically increment

    Each table should have a name column

    You should use the INT data type for at least two columns that are not a primary or foreign key

    You should use the NUMERIC data type at least once

    You should use the TEXT data type at least once

    You should use the BOOLEAN data type on at least two columns

    Each "star" should have a foreign key that references one of the rows in galaxy

    Each "planet" should have a foreign key that references one of the rows in star

    Each "moon" should have a foreign key that references one of the rows in planet

    Your database should have at least five tables

    Each table should have at least three rows

    The galaxy and star tables should each have at least six rows

    The planet table should have at least 12 rows

    The moon table should have at least 20 rows

    Each table should have at least three columns

    The galaxy, star, planet, and moon tables should each have at least five columns

    At least two columns per table should not accept NULL values

    At least one column from each table should be required to be UNIQUE

    All columns named name should be of type VARCHAR

    Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id

    Each foreign key column should have the same name as the column it is referencing
*/
CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
                 galaxy_id SERIAL PRIMARY KEY,
                 name VARCHAR(100) UNIQUE NOT NULL, 
                 description TEXT,                             
                 planet_count NUMERIC NOT NULL,                          
                 star_count NUMERIC NOT NULL,
                 age INTEGER NOT NULL
                 );

CREATE TABLE star (
                star_id SERIAL PRIMARY KEY,
                name VARCHAR(100) UNIQUE NOT NULL,
                galaxy_id SMALLINT NOT NULL,
                age INTEGER NOT NULL,
                has_planets BOOLEAN NOT NULL,
                FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
                ); 

CREATE TABLE planet (
                planet_id SERIAL PRIMARY KEY,
                name VARCHAR(100) UNIQUE NOT NULL,
                star_id INTEGER NOT NULL,
                galaxy_id INTEGER NOT NULL,
                age INTEGER NOT NULL,
                has_moon BOOLEAN NOT NULL,
                FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id),
                FOREIGN KEY (star_id) REFERENCES star(star_id));

CREATE TABLE moon (
                moon_id SERIAL PRIMARY KEY,
                name VARCHAR(100) UNIQUE NOT NULL,
                planet_id INTEGER NOT NULL,
                star_id INTEGER NOT NULL,
                age INTEGER NOT NULL,
                FOREIGN KEY (planet_id) REFERENCES planet(planet_id),
                FOREIGN KEY (star_id) REFERENCES star(star_id));

CREATE TABLE black_hole (
                      black_hole_id SERIAL PRIMARY KEY,
                      galaxy_id INTEGER NOT NULL,
                      name VARCHAR(100) UNIQUE,
                      FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
                      );

/*Could you give me the sql code to create 20 moons, 12 planets. 6 galaxies and 6 stars, and 2 black holes in the database. follow the database schema i've shown above
*/
-- Insert Galaxies
INSERT INTO galaxy (name, description, planet_count, star_count, age) VALUES
('Milky Way', 'Our home galaxy, a barred spiral galaxy', 100000000000, 400000000000, 13600),
('Andromeda', 'Nearest major galaxy to the Milky Way', 1000000000000, 1000000000000, 10000),
('Triangulum', 'Third-largest galaxy in the Local Group', 40000000000, 40000000000, 10000),
('Messier 87', 'Supergiant elliptical galaxy with a supermassive black hole', 100000000000, 1000000000000, 12500),
('Sombrero Galaxy', 'Spiral galaxy with a prominent dust lane', 100000000000, 100000000000, 13250),
('Whirlpool Galaxy', 'Classic spiral galaxy located in Canes Venatici', 60000000000, 100000000000, 12500);

-- Insert Stars
INSERT INTO star (name, galaxy_id, age, has_planets) VALUES
('Sun', 1, 4600, TRUE),
('Proxima Centauri', 1, 4850, TRUE),
('Betelgeuse', 1, 10, TRUE),
('Sirius', 1, 230, TRUE),
('Alpha Andromedae', 2, 60, TRUE),
('Triangulum Alpha', 3, 150, TRUE);

-- Insert Planets
INSERT INTO planet (name, star_id, galaxy_id, age, has_moon) VALUES
('Earth', 1, 1, 4500, TRUE),
('Mars', 1, 1, 4500, TRUE),
('Jupiter', 1, 1, 4500, TRUE),
('Saturn', 1, 1, 4500, TRUE),
('Proxima b', 2, 1, 4800, FALSE),
('Proxima c', 2, 1, 4800, FALSE),
('Betelgeuse I', 3, 1, 8, TRUE),
('Betelgeuse II', 3, 1, 8, TRUE),
('Sirius b', 4, 1, 230, FALSE),
('Andromeda Prime', 5, 2, 50, TRUE),
('Andromeda Secondary', 5, 2, 50, TRUE),
('Triangulum Major', 6, 3, 120, TRUE);

-- Insert Moons
INSERT INTO moon (name, planet_id, star_id, age) VALUES
('Moon', 1, 1, 4500),
('Phobos', 2, 1, 4500),
('Deimos', 2, 1, 4500),
('Io', 3, 1, 4500),
('Europa', 3, 1, 4500),
('Ganymede', 3, 1, 4500),
('Callisto', 3, 1, 4500),
('Titan', 4, 1, 4500),
('Enceladus', 4, 1, 4500),
('Mimas', 4, 1, 4500),
('Tethys', 4, 1, 4500),
('Dione', 4, 1, 4500),
('Rhea', 4, 1, 4500),
('Iapetus', 4, 1, 4500),
('Hyperion', 4, 1, 4500),
('Betelgeuse Moon I', 7, 3, 8),
('Betelgeuse Moon II', 7, 3, 8),
('Andromeda Lunar I', 10, 5, 50),
('Andromeda Lunar II', 11, 5, 50),
('Triangulum Satellite', 12, 6, 120);

-- Insert Black Holes
INSERT INTO black_hole (galaxy_id, name) VALUES
(4, 'M87*'),  -- The famous black hole imaged by Event Horizon Telescope
(1, 'Sagittarius A*'),  -- The black hole at the center of our Milky Way
(2, 'Andromeda Central Black Hole'), -- Black hole at the center of Andromeda
(5, 'Sombrero Abyss'), -- Black hole in the Sombrero Galaxy
(6, 'Whirlpool Vortex'); -- Black hole in the Whirlpool Galaxy