-- Active: 1690747531695@@127.0.0.1@3306

DROP DATABASE IF EXISTS netflix_db;

CREATE DATABASE netflix_db;

SHOW DATABASES;

USE netflix_db;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
    user_id INT NOT NULL AUTO_INCREMENT,
    user_handle VARCHAR(50) NOT NULL UNIQUE,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number CHAR(10) UNIQUE,
    movie_count INT NOT NULL DEFAULT 0,
    create_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS movies;

CREATE TABLE movies(
    movie_id INT NOT NULL AUTO_INCREMENT,
    name_movie VARCHAR(50) NOT NULL,
    descr_movie VARCHAR(200),
    PRIMARY KEY(movie_id)
);

DROP TABLE IF EXISTS actors;

CREATE TABLE actors(
    actor_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(actor_id)
);

DROP TABLE IF EXISTS movies_actors;

CREATE TABLE movies_actors(
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id),

    PRIMARY KEY(movie_id, actor_id)
);

DROP TABLE IF EXISTS movies_users;

CREATE TABLE movies_users(
    movie_id INT NOT NULL,
    user_id INT NOT NULL,

    time_movie TIME NOT NULL DEFAULT 0,

    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    

    PRIMARY KEY(movie_id, user_id)
);

DROP TRIGGER IF EXISTS increase_movie_count;



CREATE TRIGGER increase_movie_count
    AFTER INSERT ON movies_users
    FOR EACH ROW
    BEGIN 
        UPDATE users SET movie_count = movie_count + 1;
    END ;


-- SELECT * from users;
/*
 Mostrar ruta segura de sql
 SHOW VARIABLES LIKE 'secure_file_priv';
*/

SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(user_handle, email_address, first_name, last_name, phone_number);
SET FOREIGN_KEY_CHECKS = 1; 
-- SELECT * FROM users;

SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(name_movie, descr_movie);
SET FOREIGN_KEY_CHECKS = 1; 

SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/actors.csv'
INTO TABLE actors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(first_name, last_name);
SET FOREIGN_KEY_CHECKS = 1; 

SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies_actors.csv'
INTO TABLE movies_actors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(movie_id, actor_id);
SET FOREIGN_KEY_CHECKS = 1; 

-- SELECT * FROM movies_actors;


SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies_users.csv'
INTO TABLE movies_users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(movie_id, user_id, time_movie);
SET FOREIGN_KEY_CHECKS = 1; 