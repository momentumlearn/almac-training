WHENEVER SQLERROR CONTINUE NONE;
DROP TABLE movies CASCADE CONSTRAINTS;
DROP TABLE studios CASCADE CONSTRAINTS;
DROP TABLE movie_genres CASCADE CONSTRAINTS;
DROP TABLE genres CASCADE CONSTRAINTS;
DROP TABLE movie_actors CASCADE CONSTRAINTS;
DROP TABLE actors CASCADE CONSTRAINTS;
DROP TABLE reviewers CASCADE CONSTRAINTS;
DROP TABLE reviews CASCADE CONSTRAINTS;
DROP TABLE countries CASCADE CONSTRAINTS;
WHENEVER SQLERROR EXIT SQL.SQLCODE;


CREATE TABLE reviews (
    id NUMBER PRIMARY KEY,
    reviewer_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    score NUMBER NOT NULL
);


CREATE TABLE actors (
    id NUMBER PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE countries (
    id NUMBER PRIMARY KEY,
    code VARCHAR(2) NOT NULL
);

CREATE TABLE genres (
    id NUMBER PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);


CREATE TABLE reviewers (
    id NUMBER PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    birthdate DATE NOT NULL,
    country_id NUMBER,
    credits NUMBER DEFAULT 0 NOT NULL
);


CREATE TABLE movie_actors (
    movie_id NUMBER NOT NULL,
    actor_id NUMBER NOT NULL,
    CONSTRAINT movie_actors_pk PRIMARY KEY (movie_id, actor_id)
);


CREATE TABLE movie_genres (
    movie_id NUMBER NOT NULL,
    genre_id NUMBER NOT NULL,
    CONSTRAINT movie_genres_pk PRIMARY KEY (movie_id, genre_id)
);


CREATE TABLE movies (
    id NUMBER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    budget_in_millions NUMBER(5,2),
    revenue_in_millions NUMBER(5,2),
    runtime_in_minutes NUMBER,
    average_critic_review NUMBER(2,1),
    studio_id NUMBER
);

CREATE TABLE studios (
    id NUMBER PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

EXIT;
