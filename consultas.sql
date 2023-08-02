USE netflix_db;

SELECT * FROM users;

SELECT * FROM movies;
SELECT * FROM actors;
SELECT * FROM movies_actors;
SELECT * FROM movies_users;


SELECT actors.first_name AS nombre_actor, actors.last_name AS apellido_actor, movies.name_movie AS nombre_pelicula
FROM movies_actors
INNER JOIN actors on actors.actor_id =  movies_actors.actor_id
INNER JOIN movies on movies.movie_id = movies_actors.movie_id;

SELECT users.user_handle as Usuario, users.movie_count AS Cuantas_peliculas, movies.name_movie AS NombrePelicula
FROM movies_users
INNER JOIN users ON users.user_id = movies_users.user_id
INNER JOIN movies ON movies.movie_id = movies_users.movie_id
ORDER BY users.movie_count DESC;