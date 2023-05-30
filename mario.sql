-- Create a new database called "mario", using the CREATE DATABASE statement.
-- The purpose of this database is to present the gameplay details of the classic video game Super Mario Bros.
CREATE DATABASE mario;

-- Make sure we are using the correct database in which we created above.
USE mario;

-- Create the first table, called "world", using the CREATE TABLE statement.
CREATE TABLE world (
    world_id int not null primary key,
    world_name varchar(45) not null,
    world_boss varchar(100) not null
);

-- Insert the following data into the new "world" table, using the INSERT INTO statement.
INSERT INTO world (world_id, world_name, world_boss) VALUES 
(1, "World 1", "Fake Bowser: Goomba"),
(2, "World 2", "Fake Bowser: Koopa Troopa"),
(3, "World 3", "Fake Bowser: Buzzy Beetle"),
(4, "World 4", "Fake Bowser: Spiny"),
(5, "World 5", "Fake Bowser: Lakitu"),
(6, "World 6", "Fake Bowser: Bloober"),
(7, "World 7", "Fake Bowser: Hammer Bro"),
(8, "World 8", "Bowser");

-- Select all(*) the fields from the "world" table, using the SELECT statement.
SELECT * FROM world;

-- Create the second table, called "level", using the CREATE TABLE statement.
CREATE TABLE level (
    level_id int not null primary key,
    level_name varchar(10) not null,
    time_limit int not null,
    1up_mushroom_count int not null,
    secret_area_count int not null,
    coin_count int not null,
    world_id int not null,
    FOREIGN KEY (world_id) REFERENCES world(world_id)
);

-- Insert the following data into our new "level" table, using the INSERT INTO statement.
INSERT INTO level (level_id, level_name, time_limit, 1up_mushroom_count, secret_area_count, coin_count, world_id) VALUES
(1, "W 1-1", 400, 1, 1, 39, 1),
(2, "W 1-2", 400, 1, 2, 68, 1),
(3, "W 1-3", 300, 0, 0, 23, 1),
(4, "W 1-4", 300, 0, 0, 6, 1),
(5, "W 2-1", 400, 1, 2, 89, 2),
(6, "W 2-2", 400, 0, 0, 28, 2),
(7, "W 2-3", 300, 0, 0, 35, 2),
(8, "W 2-4", 300, 0, 0, 6, 2),
(9, "W 3-1", 400, 1, 2, 80, 3),
(10, "W 3-2", 300, 0, 0, 17, 3),
(11, "W 3-3", 300, 0, 0, 22, 3),
(12, "W 3-4", 300, 0, 0, 5, 3),
(13, "W 4-1", 400, 1, 1, 62, 4),
(14, "W 4-2", 400, 0, 3, 82, 4),
(15, "W 4-3", 300, 0, 0, 27, 4),
(16, "W 4-4", 400, 0, 0, 0, 4),
(17, "W 5-1", 300, 1, 1, 20, 5),
(18, "W 5-2", 400, 0, 2, 87, 5),
(19, "W 5-3", 300, 0, 0, 23, 5),
(20, "W 5-4", 300, 0, 0, 6, 5),
(21, "W 6-1", 400, 1, 0, 31, 6),
(22, "W 6-2", 400, 0, 4, 121, 6),
(23, "W 6-3", 300, 0, 0, 24, 6),
(24, "W 6-4", 300, 0, 0, 6, 6),
(25, "W 7-1", 400, 1, 1, 33, 7),
(26, "W 7-2", 400, 0, 0, 28, 7),
(27, "W 7-3", 300, 0, 0, 35, 7),
(28, "W 7-4", 400, 0, 0, 0, 7),
(29, "W 8-1", 300, 1, 1, 53, 8),
(30, "W 8-2", 400, 1, 1, 34, 8),
(31, "W 8-3", 300, 0, 0, 10, 8),
(32, "W 8-4", 400, 0, 0, 1, 8); 

-- Select all(*) the fields from the "level" table, using the SELECT statement.
SELECT * FROM level;

-- Create the next table, called "level_theme", using the CREATE TABLE statement.
CREATE TABLE level_theme (
    level_theme_id int not null primary key,
    level_theme varchar(20) not null
);

-- Insert the following data into the new "level_theme" table, using the INSERT INTO statement.
INSERT INTO level_theme (level_theme_id, level_theme) VALUES 
(1, "Overworld"),
(2, "Underground"),
(3, "Underwater"),
(4, "Athletic"),
(5, "Castle");

-- Select all(*) the fields from the "level_theme" table, using the SELECT statement.
SELECT * FROM level_theme;

-- Create the next table, called "theme_music", using the CREATE TABLE statement.
CREATE TABLE theme_music (
    theme_music_id int not null primary key,
    theme_music varchar(20) not null
);

-- Insert the following data into the new "theme_music" table, using the INSERT INTO statement.
INSERT INTO theme_music (theme_music_id, theme_music) VALUES 
(1, "Overworld"),
(2, "Underground"),
(3, "Underwater"),
(4, "Castle"),
(5, "Coin Heaven"),
(6, "Level Clear"),
(7, "Castle Clear"),
(8, "Ending Fanfare");

-- Select all(*) the fields from the "theme_music" table, using the SELECT statement.
SELECT * FROM theme_music;

-- Create the next table, called "secret_area", using the CREATE TABLE statement.
CREATE TABLE secret_area (
    secret_area_id int not null primary key,
    secret_area varchar(15) not null
);

-- Insert the following data into the new "secret_area" table, using the INSERT INTO statement.
INSERT INTO secret_area (secret_area_id, secret_area) VALUES 
(1, "Pipe"),
(2, "Coin Heaven"),
(3, "Warp Zone");

-- Select all(*) the fields from the "secret_area" table, using the SELECT statement.
SELECT * FROM secret_area;

-- There is a many-to-many relationship between the "level" table and the "level_theme" table.
CREATE TABLE level_has_theme (
	level_id int,
    level_theme_id int,
	FOREIGN KEY (level_id) REFERENCES level(level_id),
    FOREIGN KEY (level_theme_id) REFERENCES level_theme(level_theme_id)
);

-- Insert the following data into the new "level_has_theme" table, using the INSERT INTO statement.
INSERT INTO level_has_theme (level_theme_id, level_id) VALUES 
(1, 1), (1, 5), (1, 9), (1, 10), (1, 13), (1, 17), (1, 18), (1, 21), (1, 22), (1, 25), 
(1, 29), (1, 30), (1, 31), (2, 2), (2, 14), (3, 6), (3, 26), (4, 3), (4, 7), (4, 11), 
(4, 15), (4, 19), (4, 23), (4, 27), (5, 4), (5, 8), (5, 12), (5, 16), (5, 20), (5, 24),
(5, 28), (5, 32);

-- Select all(*) the fields from the "level_has_theme" table, using the SELECT statement.
SELECT * FROM level_has_theme;

-- There is a many-to-many relationship between the "level" table and the "theme_music" table.
CREATE TABLE level_has_theme_music (
	level_id int,
    theme_music_id int,
	FOREIGN KEY (level_id) REFERENCES level(level_id),
    FOREIGN KEY (theme_music_id) REFERENCES theme_music(theme_music_id)
);

-- Insert the following data into the new "level_has_theme_music" table, using the INSERT INTO statement.
INSERT INTO level_has_theme_music (theme_music_id, level_id) VALUES 
(1, 1), (1, 2), (1, 3), (1, 5), (1, 6), (1, 7), (1, 9), (1, 10), (1, 11), (1, 13), 
(1, 14), (1, 15), (1, 17), (1, 18), (1, 19), (1, 21), (1, 22), (1, 23), (1, 25), (1, 26), 
(1, 27), (1, 29), (1, 30), (1, 31), (2, 1), (2, 2), (2, 5), (2, 9), (2, 13), (2, 14), 
(2, 17), (2, 22), (2, 25), (2, 29), (2, 30), (3, 6), (3, 18), (3, 22), (3, 26), (3, 32), 
(4, 4), (4, 8), (4, 12), (4, 16), (4, 20), (4, 24), (4, 28), (4, 32), (5, 5), (5, 9), 
(5, 18), (5, 22), (6, 1), (6, 2), (6, 3), (6, 5), (6, 6), (6, 7), (6, 9), (6, 10), 
(6, 11), (6, 13), (6, 14), (6, 15), (6, 17), (6, 18), (6, 19), (6, 21), (6, 22), (6, 23), 
(6, 25), (6, 26), (6, 27), (6, 29), (6, 30), (6, 31), (7, 4), (7, 8), (7, 12), (7, 16), 
(7, 20), (7, 24), (7, 28), (7, 32), (8, 32);

-- Select all(*) the fields from the "level_has_theme_music" table, using the SELECT statement.
SELECT * FROM level_has_theme_music;

-- There is a many-to-many relationship between the "level" table and the "secret_area" table.
CREATE TABLE level_has_secret_area (
	level_id int,
    secret_area_id int,
	FOREIGN KEY (level_id) REFERENCES level(level_id),
    FOREIGN KEY (secret_area_id) REFERENCES secret_area(secret_area_id)
);

-- Insert the following data into the new "level_has_secret_area" table, using the INSERT INTO statement.
INSERT INTO level_has_secret_area (secret_area_id, level_id) VALUES 
(1, 1), (1, 2), (1, 5), (1, 9), (1, 13), (1, 14), (1, 17), (1, 18), (1, 22), 
(1, 25), (1, 29), (1, 30), (2, 5), (2, 9), (2, 18), (2, 22), (3, 2), (3, 14);

-- Select all(*) the fields from the "level_has_secret_area" table, using the SELECT statement.
SELECT * FROM level_has_secret_area;

-- Create the next table, called "powerup", using the CREATE TABLE statement.
CREATE TABLE powerup (
    powerup_id int not null primary key,
    powerup_name varchar(15) not null
);

-- Insert the following data into the new "powerup" table, using the INSERT INTO statement.
INSERT INTO powerup (powerup_id, powerup_name) VALUES 
(1, "Fire Flower"),
(2, "Starman");

-- Select all(*) the fields from the "powerup" table, using the SELECT statement.
SELECT * FROM powerup;

-- Create the next table, called "enemy", using the CREATE TABLE statement.
CREATE TABLE enemy (
    enemy_id int not null primary key,
    enemy_name varchar(45) not null
);

-- Insert the following data into the new "enemy" table, using the INSERT INTO statement.
INSERT INTO enemy (enemy_id, enemy_name) VALUES 
(1, "Bloober"),
(2, "Bullet Bill"),
(3, "Buzzy Beetle"),
(4, "Cheep-Cheep"),
(5, "Fire Bar"),
(6, "Hammer Bro"),
(7, "Koopa Paratroopa"),
(8, "Koopa Troopa"),
(9, "Lakitu"),
(10, "Goomba"),
(11, "Piranha Plant"),
(12, "Podoboo"),
(13, "Spiny"),
(14, "Spiny Egg"),
(15, "Turtle Cannon");

-- Select all(*) the fields from the "enemy" table, using the SELECT statement.
SELECT * FROM enemy;

-- There is a many-to-many relationship between the "level" table and the "powerup" table.
CREATE TABLE level_has_powerup (
	level_id int,
    powerup_id int,
	FOREIGN KEY (level_id) REFERENCES level(level_id),
    FOREIGN KEY (powerup_id) REFERENCES powerup(powerup_id)
);

-- Insert the following data into the new "level_has_powerup" table, using the INSERT INTO statement.
INSERT INTO level_has_powerup (powerup_id, level_id) VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), 
(1, 12), (1, 13), (1, 14), (1, 15), (1, 18), (1, 19), (1, 20), (1, 21), (1, 22), 
(1, 23), (1, 24), (1, 25), (1, 27), (1, 30), (1, 31), (2, 1), (2, 2), (2, 5), 
(2, 9), (2, 10), (2, 14), (2, 17), (2, 18), (2, 22), (2, 25), (2, 29);

-- Select all(*) the fields from the "level_has_powerup" table, using the SELECT statement.
SELECT * FROM level_has_powerup;

-- There is a many-to-many relationship between the "level" table and the "enemy" table.
CREATE TABLE level_has_enemy (
	level_id int,
    enemy_id int,
	FOREIGN KEY (level_id) REFERENCES level(level_id),
    FOREIGN KEY (enemy_id) REFERENCES enemy(enemy_id)
);

-- Insert the following data into the new "level_has_enemy" table, using the INSERT INTO statement.
INSERT INTO level_has_enemy (enemy_id, level_id) VALUES 
(1, 6), (1, 18), (1, 22), (1, 26), (1, 32), (2, 17), (2, 18), (2, 19), (2, 23), (2, 25), 
(2, 30), (2, 31), (3, 14), (3, 18), (3, 22), (3, 25), (3, 29), (3, 30), (3, 32), (4, 6), 
(4, 7), (4, 18), (4, 22), (4, 26), (4, 27), (4, 32), (5, 4), (5, 8), (5, 12), (5, 16), 
(5, 20), (5, 24), (5, 28), (5, 32), (6, 9), (6, 18), (6, 25), (6, 31), (6, 32), (7, 3), 
(7, 5), (7, 9), (7, 10), (7, 11), (7, 15), (7, 17), (7, 18), (7, 19), (7, 22), (7, 25), 
(7, 27), (7, 29), (7, 30), (7, 31), (7, 32), (8, 1), (8, 2), (8, 3), (8, 5), (8, 9), 
(8, 10), (8, 11), (8, 14), (8, 15), (8, 17), (8, 18), (8, 19), (8, 22), (8, 25), (8, 27), 
(8, 29), (8, 31), (9, 13), (9, 21), (9, 30), (10, 1), (10, 2), (10, 3), (10, 5), (10, 9), 
(10, 10), (10, 11), (10, 14), (10, 17), (10, 18), (10, 19), (10, 22), (10, 29), (10, 30), 
(11, 2), (11, 5), (11, 6), (11, 9), (11, 10), (11, 13), (11, 14), (11, 17), (11, 18), (11, 21), 
(11, 22), (11, 25), (11, 26), (11, 29), (11, 30), (11, 31), (11, 32), (12, 8), (12, 12), (12, 16), 
(12, 20), (12, 24), (12, 28), (12, 32), (13, 13), (13, 21), (13, 30), (14, 13), (14, 21), (14, 30), 
(15, 17), (15, 18), (15, 25), (15, 30), (15, 31);

-- Select all(*) the fields from the "level_has_enemy" table, using the SELECT statement.
SELECT * FROM level_has_enemy;

-- Add an additional line of data to the "world" table.
INSERT INTO world (world_id, world_name, world_boss) VALUES 
(9, "World 9", "Dry Bowser");

SELECT * FROM world;

-- Demonstration of modifying an existing record from the "world" table.
UPDATE world
SET world_name = 'Secret World'
WHERE world_id = 9;

SELECT * FROM world;

-- Demonstration of deleting an existing record from the "world" table.
DELETE FROM world 
WHERE world_name = 'Secret World';

SELECT * FROM world;


-- SQL Commands

-- Return all the levels that have a time limit of 300.
SELECT level_name
FROM level
WHERE time_limit = 300;

-- Return all the levels that have a coin count of less than 40.
SELECT level_name, coin_count
FROM level
WHERE coin_count < 40
ORDER BY coin_count DESC;

-- Return all the levels that have a time limit of 400 OR are World 6 levels
-- Note: The OR operator displays a record if any of the conditions separated by OR is TRUE.
SELECT level_name, time_limit
FROM level
WHERE time_limit = 400 OR world_id = 6;

-- Return all the levels that have a coin count of more than 30 AND are World 7 levels
-- Note: The AND operator displays a record if all the conditions separated by AND are TRUE.
SELECT level_name, coin_count
FROM level
WHERE coin_count > 30 AND world_id = 7;

-- Return all the enemies that are between "Ga" and "Po".
SELECT enemy_name
FROM enemy
WHERE enemy_name BETWEEN "Ga" AND "Po"
ORDER BY enemy_name;


-- Perform a JOIN between two (or more) tables.

-- Return all the levels that the 'Hammer Bro' enemy is found in.
SELECT level_name
FROM level AS l
INNER JOIN level_has_enemy AS lhe
ON l.level_id = lhe.level_id
INNER JOIN enemy AS e
ON e.enemy_id = lhe.enemy_id
WHERE e.enemy_id = 6;

-- Return all the levels that have an 'Athletic' theme.
SELECT level_name
FROM level AS l
INNER JOIN level_has_theme AS lht
ON l.level_id = lht.level_id
INNER JOIN level_theme AS lt
ON lt.level_theme_id = lht.level_theme_id
WHERE lt.level_theme_id = 4;


-- Use aggregate functions to summarize numerical data.

-- Return the total number of levels that have a hidden 1up mushroom.
SELECT COUNT(level_name) AS "Number of Levels with Hidden 1up Mushrooms"
FROM level
WHERE 1up_mushroom_count >= 1;

-- Return the total sum of secret areas in the game.
SELECT SUM(secret_area_count) AS "Total Sum of Secret Areas"
FROM level;

-- Return the average level coin count in the game.
SELECT AVG(coin_count) AS "Average Level Coin Count"
FROM level;
