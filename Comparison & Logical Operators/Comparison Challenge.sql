USE book_shop;
SELECT * FROM books;

-- 1. Select all books writen before 1980 (non inclusive):
SELECT title
FROM books
WHERE released_year < '1980';

-- 2. SELECT all books writen by 'Eggers' or 'Chabon':
SELECT title, author_lname
FROM books
WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

-- 3. Select all books writen by 'Lahiri' published after 2000:
SELECT title
FROM books
WHERE author_lname = 'Lahiri' AND released_year > '2000';

-- 4. Select all books with pages between 100 and 200:
SELECT title
FROM books
WHERE pages BETWEEN 100 AND 200;

-- 5. Select all books where author_lname starts wuth a 'C' or a 'S':
SELECT title, author_lname
FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- 6. With example:
SELECT title, author_lname,
 CASE
  WHEN title LIKE '%stories%' THEN 'Short stories'
  WHEN title IN('A Heartbreaking Work of Staggering Genius', 'Just Kids')  THEN 'Memoir'
  ELSE 'Novel'
 END AS TYPE
FROM books;

-- 7. With example:
SELECT author_fname, author_lname,
 CASE
 WHEN COUNT(*) = 1 THEN '1 book'
 ELSE CONCAT(COUNT(*), ' books')
 END  AS count
FROM books
GROUP BY author_fname, author_lname;

