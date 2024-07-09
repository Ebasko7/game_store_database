DROP TABLE IF EXISTS genre_game CASCADE;
DROP TABLE IF EXISTS social_security CASCADE;
DROP TABLE IF EXISTS shifts CASCADE;
DROP TABLE IF EXISTS game CASCADE;
DROP TABLE IF EXISTS gaming_engine CASCADE;
DROP TABLE IF EXISTS poster CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS action_figure CASCADE;
DROP TABLE IF EXISTS genre CASCADE;


CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL UNIQUE --CHECK(genre_name ~ '^[A-Za-z]+$')
);
\COPY genre FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/genre.csv' WITH CSV HEADER;

CREATE TABLE action_figure (
    id INT PRIMARY KEY,
    action_figure_title VARCHAR(255) UNIQUE NOT NULL, --CHECK(action_figure_title ~ '^[A-Za-z0-9 _\-:''\\]+$'),
    quantity INT NOT NULL CHECK(quantity BETWEEN 1 AND 30),
    price DECIMAL(5,2) NOT NULL CHECK(price BETWEEN 10.00 AND 100.00)
);
\COPY action_figure FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/action_figure.csv' WITH CSV HEADER;


CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL, --CHECK(employee_name ~ '^[A-Za-z ]+$'),
    position VARCHAR CHECK(position IN ('Sales Associate', 'Store Manager', 'Inventory Clerk', 'Customer Service Representative', 'IT Specialist', 'Marketing Coordinator', 'Assistant Manager', 'Finance Analyst', 'Security Officer', 'HR Coordinator')),
    salary DECIMAL(7,2) NOT NULL CHECK(salary BETWEEN 30000 AND 60000)
);
\COPY employee FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/employee.csv' WITH CSV HEADER;


CREATE TABLE poster (
    id INT PRIMARY KEY,
    poster_title VARCHAR(255) NOT NULL UNIQUE, --CHECK(poster_title ~ '^[a-zA-Z0-9_ ]*'),
    quantity INT NOT NULL CHECK(quantity BETWEEN 1 AND 30),
    price DECIMAL(4,2) NOT NULL CHECK(price BETWEEN 6.00 AND 20.00)
);
\COPY poster FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/poster.csv' WITH CSV HEADER;


CREATE TABLE social_security (
    id SERIAL PRIMARY KEY,
    employee_id INT,
    ssn VARCHAR(255) UNIQUE CHECK(ssn ~ '^[0-9]{3}-[0-9]{2}-[0-9]{4}$'),
    FOREIGN KEY (id) REFERENCES employee (employee_id)
);
\COPY social_security FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/social_security.csv' WITH CSV HEADER;


CREATE TABLE shifts (
    shifts_id SERIAL PRIMARY KEY,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);
\COPY shifts FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/shifts.csv' WITH CSV HEADER;

CREATE TABLE gaming_engine (
    engine_id SERIAL PRIMARY KEY,
    engine_name VARCHAR(255) NOT NULL UNIQUE --CHECK('^[A-Za-z0-9 ]+$')
);
\COPY gaming_engine FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/gaming_engine.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS game CASCADE;
CREATE TABLE game (
    game_id SERIAL PRIMARY KEY,
    game_title VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(5,2) NOT NULL
);

\COPY game FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/game.csv' WITH CSV HEADER;

CREATE TABLE genre_game (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);
\COPY genre_game FROM '/Users/ericbaskovich/Desktop/CodePlatoon/WEEK6/gameSQL/data/genre_game.csv' WITH CSV HEADER;









