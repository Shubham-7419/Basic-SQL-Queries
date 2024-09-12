USE book_shop;
-- Using books table, dataset can be found in other SQL queries

-- Comparison Operators
-- Using not equal (!=)
SELECT * FROM books
WHERE released_year != 2017;


-- Using not like
SELECT * FROM books
WHERE title NOT LIKE '%e%';


-- Using greater than (>)
SELECT * FROM books
WHERE released_year > 2005;
 
SELECT * FROM books
WHERE pages > 500;


-- Using less than (<) or equal to (=)
SELECT * FROM books
WHERE pages < 200;
 
SELECT * FROM books
WHERE released_year < 2000;
 
SELECT * FROM books
WHERE released_year <= 1985;


-- Logical Operators
-- Logical AND operator
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';
 
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';


-- Logical OR Operator
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;
 
 
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';


-- Logical Between Operator
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;

SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2014;


-- Logical IN operator
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');


-- Using Case Satements
SELECT title , released_year,
	CASE
		WHEN released_year >= 2000 THEN 'mordern lit'
        ELSE '20th century lit'
	END AS genere
FROM books;

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;


-- Using IS NULL
SELECT title FROM books WHERE title IS NULL;


-- Comparing date and time in SQl using a hypotetical data
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);

SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;


-- Excercise for Logical and Comparision Operators
USE book_shop;

-- Selecting books written before 1980 (non-inclusive)
SELECT * FROM books
WHERE released_year < 1980;

-- Selecting all books written by author last name either Eggers or Chabon
SELECT * FROM books
WHERE author_lname IN ('Eggers' , 'Chabon');

-- Selecting all books written by Lahiri published after 2000
SELECT * FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- Selecting all books with page count between 100 and 200
SELECT * FROM books
WHERE pages BETWEEN 100 AND 200;

-- Selecting all books where authore last name starts with a 'C' or an 'S'
SELECT * FROM books
WHERE author_lname LIKE ('c%') or author_lname LIKE ('s%');

-- if title contains stories then add Type 'Short Stories' 
-- just kids and a heartbreaking work type as 'Memoir'
-- Everthing else as 'Novel'
SELECT title , author_lname,
	CASE
		WHEN title LIKE ('%stories%') THEN 'Short Stories'
        WHEN title LIKE ('%Just Kids%') OR title LIKE ('%A Heartbreaking work%') THEN 'Memoir'
        ELSE 'Novel'
    END AS type
FROM books;

-- Counting all book written by authors
SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;