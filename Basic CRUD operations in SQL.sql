CREATE DATABASE crud;
USE crud;


-- Create the new cats table:
CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 


-- Insert some cats:
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- To get all the columns:
SELECT * FROM cats;


-- To only get the age column:
SELECT age FROM cats;


-- To select multiple specific columns:
SELECT name, breed FROM cats;


-- Use where to specify a condition:
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE name ='Egg';


-- 'AS' to alias a column in your results
SELECT cat_id AS id, name FROM cats;

-- Use update clause
-- Change tabby cats to shorthair:
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
-- Another update:
UPDATE cats SET age=14 WHERE name='Misty';


-- Delete all 4 year old cats:
DELETE FROM cats WHERE age=4;
-- Delete cats where cat_id is the same as their age:
DELETE FROM cats WHERE cat_id=age;
-- Delete all cats:
DELETE FROM cats;