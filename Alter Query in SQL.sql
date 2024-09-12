USE constraints;
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);

CREATE TABLE houses (
    purchase_price VARCHAR(255) NOT NULL,
    sale_price VARCHAR(255) NOT NULL
);

-- Alter Table : Adding Column
ALTER TABLE companies
ADD COLUMN phone VARCHAR(11);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;


-- Alter table : Dropping Columns
ALTER TABLE companies DROP COLUMN phone;


-- Alter table: Renaming table and Renaming Column Name
RENAME TABLE companies to suppliers;

ALTER TABLE suppliers RENAME TO companies;

ALTER TABLE companies
RENAME COLUMN name TO company_name;


-- Alter Table : Modifying Existing Column
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


-- Alter table: Constraints
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;