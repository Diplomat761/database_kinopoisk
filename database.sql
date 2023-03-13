create database kinopoisk;


CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birth_date DATE,
    death_date DATE
);

CREATE TABLE movie (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    year INTEGER NOT NULL,
    plot TEXT,
    director_id INTEGER REFERENCES person (id) ON DELETE SET NULL,
    writer_id INTEGER REFERENCES person (id) ON DELETE SET NULL,
    runtime INTEGER
);

CREATE TABLE country (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE movie_country (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movie (id) ON DELETE CASCADE,
    country_id INTEGER REFERENCES country (id) ON DELETE CASCADE
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE movie_genre (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movie (id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genre (id) ON DELETE CASCADE
);

CREATE TABLE person_movie (
    id SERIAL PRIMARY KEY,
    person_id INTEGER REFERENCES person (id) ON DELETE CASCADE,
    movie_id INTEGER REFERENCES movie (id) ON DELETE CASCADE,
    role TEXT NOT NULL
);
CREATE TABLE views_by_country (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movie (id) ON DELETE CASCADE,
    country_id INTEGER REFERENCES country (id) ON DELETE CASCADE,
    views INTEGER NOT NULL
);
