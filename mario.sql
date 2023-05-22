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

-- Insert the following data into our new "world" table, using the INSERT INTO statement.
INSERT INTO world (world_id, world_name, world_boss) VALUES 
(1, "World 1", "Fake Bowser: Goomba"),
(2, "World 2", "Fake Bowser: Koopa Troopa"),
(3, "World 3", "Fake Bowser: Buzzy Beetle"),
(4, "World 4", "Fake Bowser: Spiny"),
(5, "World 5", "Fake Bowser: Lakitu"),
(6, "World 6", "Fake Bowser: Bloober"),
(7, "World 7", "Fake Bowser: Hammer Bro"),
(8, "World 8", "Bowser");

-- Select all(*) the fields from our "world" table, using the SELECT statement.
SELECT * FROM world;