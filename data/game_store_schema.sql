
DROP TABLE IF EXISTS action_figure;
CREATE TABLE action_figure (
    id INT PRIMARY KEY,
    action_figure_title VARCHAR,
    quantity INT,
    price DECIMAL(5,2)
);

\COPY action_figure FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/action_figure.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    employee_name VARCHAR,
    position VARCHAR,
    salary DECIMAL(7,2)
);

\COPY employee FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/employee.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS poster;
CREATE TABLE poster (
    id INT PRIMARY KEY,
    poster_title VARCHAR,
    quantity INT,
    price DECIMAL(4,2)
);

\COPY poster FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/poster.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255),
    
);

DROP TABLE IF EXISTS social_security;
CREATE TABLE social_security(
    id SERIAL PRIMARY KEY,
    security_number VARCHAR(255),
    employee BIGINT,
);

DROP TABLE IF EXISTS shifts;
CREATE TABLE shifts(
    id SERIAL PRIMARY KEY,
    shift_start TIMESTAMP,
    shift_end TIMESTAMP,
    employee INT,
);

DROP TABLE IF EXISTS gaming_engine;
CREATE TABLE gaming_engine( 
    id SERIAL PRIMARY KEY;
    engine VARCHAR(255);
);

DROP TABLE IF EXISTS genre_game;
CREATE TABLE genre_game(
    id SERIAL PRIMARY KEY;
    game INT;
    genre INT;
);

DROP TABLE IF EXISTS game;
CREATE TABLE game (
    id SERIAL PRIMARY KEY;
    game_title VARCHAR(255);
    quantity INT;
    price DECIMAL(5,2);
    engine INT;
);