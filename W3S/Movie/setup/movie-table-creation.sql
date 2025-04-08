-- Kreiranje sheme
CREATE SCHEMA IF NOT EXISTS movies;

-- Uporaba sheme
USE movies;

-- Tabela actor
CREATE TABLE actor (
    act_id INTEGER PRIMARY KEY,
    act_fname CHAR(20) NOT NULL,
    act_lname CHAR(20) NOT NULL,
    act_gender CHAR(1) NOT NULL
);


-- Tabela director
CREATE TABLE director(
    dir_id INTEGER PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);

-- Tabela movie_direction
CREATE TABLE movie_direction(
FOREIGN KEY (dir_id) REFERENCES director(dir_id),
FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);



-- Tabela movie_cast
CREATE TABLE movie_cast(
    FOREIGN KEY(act_id) REFERENCES actor(act_id),
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id),
    role CHAR(30)
);



-- Tabela movie
CREATE TABLE movie(
    mov_id INTEGER PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INTEGER,
    mov_time INTEGER,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);



-- Tabela reviewer

CREATE TABLE reviewer(
    rev_id INTEGER PRIMARY KEY,
    rev_name CHAR(30)
);


-- Tabela genres
CREATE TABLE genres(
gen_id INTEGER PRIMARY KEY,
gen_title CHAR(20)
);

-- Tabela movie_genres
CREATE TABLE movie_genres(
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);


-- Tabela rating
CREATE TABLE rating(
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id),
    rev_stars INTEGER,
    num_o_ratings INTEGER
);

