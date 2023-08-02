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

