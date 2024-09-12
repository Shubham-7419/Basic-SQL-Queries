-- Create and use database
CREATE DATABASE basic_excercise;
USE basic_excercise;

-- Create the table:
CREATE TABLE pastries (
    name VARCHAR(50),
    quantity INT
);

CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);

-- View tables:
SHOW TABLES;

-- View details of pastries table:
DESC pastries;

-- Delete the whole pastries table:
DROP TABLE pastries;

-- Insert a cat:
INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);

-- Single insert (switching order of name and age)
INSERT INTO cats (age, name) 
VALUES 
  (2, 'Beth');

-- Multiple Insert:
INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);

-- Using NOT NULL:
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- Define a table with a DEFAULT name specified:
CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);

-- One way of specifying a PRIMARY KEY
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
-- Another option of specifying a PRIMARY KEY:
CREATE TABLE unique_cats2 (
	cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

--  AUTO_INCREMENT
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

-- Create table\Insert Excercise
CREATE TABLE employees (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);

-- A test INSERT:
INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);


-- Delete the whole database:
DROP DATABASE basic_excercise;