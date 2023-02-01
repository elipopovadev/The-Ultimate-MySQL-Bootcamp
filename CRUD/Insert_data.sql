CREATE DATABASE db_employees;
USE db_employees;

CREATE TABLE work_places
(
 id INT AUTO_INCREMENT PRIMARY KEY,
 office_name VARCHAR(100) NOT NULL,
 street VARCHAR(100) NOT NULL,
 street_number INT NOT NULL,
 employee_id INT NOT NULL,
 UNIQUE KEY unique_office_name (office_name)
 );

CREATE TABLE employees
(
 id INT AUTO_INCREMENT PRIMARY KEY,
 last_name VARCHAR(100) NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 middle_name VARCHAR(100),
 age INT NOT NULL,
 current_status VARCHAR(100) DEFAULT 'employee',
 office_id INT NOT NULL,
 FOREIGN KEY (office_id)
   REFERENCES work_places(id)
);

INSERT INTO work_places(office_name, street, street_number, employee_id)
VALUES ('Pirin', 'Colcotica', 10, 1),
       ('Dunav', 'Aladin', 43, 2),
       ('Rilski', 'Botev', 30, 3),
       ('Gotsev', 'Varshava', 36, 4);

SELECT * FROM work_places;

INSERT INTO employees(last_name, first_name, middle_name, age, office_id)
VALUES ('Dragoev', 'Peter', 'Ivanov', 29, 3),
       ('Pavlova', 'Irina', 'Andreeva', 30, 2),
       ('Nikolaeva', 'Ana', 'Ruseva', 24, 2),
       ('Perinina', 'George', 'Videlov', 27, 3);

DESCRIBE employees;
DESCRIBE work_places;
