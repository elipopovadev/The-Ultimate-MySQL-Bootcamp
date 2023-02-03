USE book_shop;
SELECT * FROM books;

SELECT REPLACE(title, ' ', '->') AS 'title'
FROM books;

SELECT author_lname AS 'forwards',
       REVERSE(author_lname) AS 'backwards'
FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full_name'
FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS 'blurb'
FROM books;

SELECT title, CHAR_LENGTH(title) AS 'char_count'
FROM books;

SELECT CONCAT(LEFT(title, 10), '...') AS 'short_title',
       CONCAT(author_lname, ', ', author_fname) AS 'author',
       CONCAT(stock_quantity, ' ', 'is stock') AS 'quantity'
FROM books;
      
