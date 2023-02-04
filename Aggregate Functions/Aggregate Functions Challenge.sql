USE book_shop;
SELECT * FROM books;

-- 1. Print out the number of books in the database:
SELECT COUNT(title)
FROM books;

-- 2. Print out how many books were released in each year:
SELECT released_year, COUNT(title) AS books_number
FROM books
GROUP BY released_year;

-- 3. Print out the total number of books in stock:
SELECT SUM(stock_quantity) AS total_number
FROM books;

-- 4. Find the average released year for each author:
SELECT CONCAT(author_fname, ' ', author_lname) AS 'author',
       AVG(released_year) AS 'average_released_year'
FROM books
GROUP BY author
ORDER BY author;

-- 5. Find the full name of the author who wrote thw longest book:
SELECT CONCAT(author_fname, ' ', author_lname) AS 'author',
       pages
FROM books
WHERE pages = (SELECT MAX(pages)
                FROM books);

-- 6. Make this happen- 'year'-'# books per yer'-'average pages per this book': 
SELECT released_year AS 'year', 
       COUNT(title) AS '# books',
       AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;

