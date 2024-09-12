CREATE DATABASE joins;
USE joins;
CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50)
);
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATE,
  amount DECIMAL(8, 2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
SHOW TABLES;
INSERT INTO
  customers (first_name, last_name, email)
VALUES
  ('Boy', 'George', 'george@gmail.com'),
  ('George', 'Michael', 'gm@gmail.com'),
  ('David', 'Bowie', 'david@gmail.com'),
  ('Blue', 'Steele', 'blue@gmail.com'),
  ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO
  orders (order_date, amount, customer_id)
VALUES
  ('2016-02-10', 99.99, 1),
  ('2017-11-11', 35.50, 1),
  ('2014-12-12', 800.67, 2),
  ('2015-01-03', 12.50, 2),
  ('1999-04-11', 450.25, 5);
  
  -- Using ON DELETE CASCSDE
-- The ON DELETE CASCADE option in SQL is used to maintain referential integrity between tables. When you define a
-- foreign key with ON DELETE CASCADE, it ensures that if a row in the parent table is deleted, all related rows in the
-- child table are automatically deleted as well. This prevents orphaned records in the child table.
-- Here’s a simple example to illustrate:

-- 1. Create Parent Table:
CREATE TABLE Parent (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- 2. Create Child Table with Foreign Key:
CREATE TABLE Child (
    id INT PRIMARY KEY,
    parent_id INT,
    description VARCHAR(100),
    FOREIGN KEY (parent_id) REFERENCES Parent (id) ON DELETE CASCADE
);

INSERT INTO Parent (id, name) VALUES (1, 'Parent1');
INSERT INTO Child (id, parent_id, description) VALUES (1, 1, 'Child1');

DELETE FROM Parent WHERE id = 1;
-- After executing the delete statement on the parent table, the corresponding row in the child table will also be deleted automatically.