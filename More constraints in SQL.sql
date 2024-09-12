CREATE DATABASE constraints;
USE constraints;


-- Using Unique Constraint
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
-- Error Code: 1062. Duplicate entry '8781213455' for key 'contacts.phone'


-- Using Check Constraint
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

INSERT INTO users VALUES ('Shubham jain' , 25);

INSERT INTO users VALUES ('Dexter' , -25);
-- Error Code: 3819. Check constraint 'users_chk_1' is violated.


-- Creating a Named Constraint
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);


-- Multiple Column Constraint
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);