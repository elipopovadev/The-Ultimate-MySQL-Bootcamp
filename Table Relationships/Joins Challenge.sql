CREATE DATABASE university_db;
USE university_db;

CREATE TABLE students
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL
);

CREATE TABLE papers
(
 title VARCHAR(100) NOT NULL,
 grade INT NOT NULL,
 student_id INT NOT NULL,
 CONSTRAINT FK_Student_Papers
 FOREIGN KEY(student_id)
 REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
			('Caleb'), 
			('Samantha'), 
			('Raj'), 
			('Carlos'),
			('Lisa');
     
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT students.first_name, papers.title, papers.grade
FROM students
INNER JOIN papers 
ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT students.first_name, papers.title, papers.grade
FROM students
LEFT JOIN papers 
ON students.id = papers.student_id;

SELECT students.first_name, 
IFNULL(papers.title, 'Title'), 
IFNULL(papers.grade, 0)
FROM students
LEFT JOIN papers 
ON students.id = papers.student_id;

SELECT students.first_name, 
IFNULL(AVG(papers.grade), 0) AS 'average'
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.first_name
ORDER BY average DESC;

SELECT students.first_name, 
IFNULL(AVG(papers.grade), 0) AS 'average',
CASE
WHEN AVG(papers.grade) >= 75 THEN 'passing'
ELSE 'failing'
END AS 'passing_status'
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.first_name
ORDER BY average DESC;

