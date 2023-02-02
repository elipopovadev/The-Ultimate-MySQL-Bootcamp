CREATE DATABASE shirts_db;
USE shirts_db;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE shirts
(
  shirt_id INT AUTO_INCREMENT PRIMARY KEY,
  article VARCHAR(20) NOT NULL,
  color VARCHAR(20) NOT NULL,
  shirt_size CHAR(1) NOT NULL,
  last_worn INT NOT NULL
);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
	   ('t-shirt', 'green', 'S', 200),
       ('polo shirt', 'black', 'M', 10),
       ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0),
       ('polo shirt', 'red', 'M', 5),
       ('tank top', 'write', 'S', 200),
       ('tank top', 'blue', 'M', 15);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

SELECT article, color
FROM shirts;

SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE shirt_size = 'M';

SELECT * FROM shirts;

UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';

SELECT * FROM shirts
WHERE article = 'polo shirt';

UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15;

SELECT * FROM shirts;

ALTER TABLE shirts
MODIFY COLUMN shirt_size CHAR(2);

UPDATE shirts
SET color = 'off white',
	shirt_size = 'XS'
WHERE color = 'white';

DELETE FROM shirts
WHERE last_worn = 200;

DELETE FROM shirts
WHERE article = 'tank top';

SELECT * FROM shirts;

DELETE FROM shirts;

DROP TABLE shirts;

