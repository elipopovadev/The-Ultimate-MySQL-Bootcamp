CREATE DATABASE store_db;
USE store_db;

CREATE TABLE customers
(
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  email varchar(100) NOT NULL
);

CREATE TABLE orders
(
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 order_date DATE,
 amount DECIMAL(8,2) NOT NULL DEFAULT 0,
 customer_id INT NOT NULL,
 CONSTRAINT FK_CustomerOrder FOREIGN KEY(customer_id)
 REFERENCES customers(customer_id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'boy@abv.bg'),
	   ('George','Michael','george@abv.bg'),
       ('David','Bowie','david@abv.bg'),
       ('Blue','Steele','blue@abv.bg'),
       ('Ana','Ivanova','ana@abv.bg');
       
INSERT INTO orders(order_date, amount, customer_id)
VALUES ('2019-02-10', 100.34, 1),
	   ('2022-03-10',200.25, 1),
       ('2023-02-09',234.39, 2),
       ('2023-01-26',345.34, 3),
	   ('2022-03-10',200.25, 3),
       ('2022-03-10',200.25, 1),
	   ('2022-03-10',200.25, 4),
       ('2022-03-10',200.25, 4);
       
SELECT customers.first_name, customers.last_name, customers.email,
        orders.order_date, orders.amount
FROM customers
CROSS JOIN orders;


SELECT customers.first_name, customers.last_name, customers.email,
        orders.order_date, orders.amount
FROM customers
INNER JOIN orders 
WHERE customers.customer_id = orders.customer_id;


SELECT customers.first_name, customers.last_name,
       SUM(orders.amount) as 'total_amount'
FROM customers
INNER JOIN orders 
WHERE customers.customer_id = orders.customer_id
GROUP BY customers.first_name, customers.last_name
ORDER BY total_amount DESC;


SELECT customers.first_name, customers.last_name,
       IFNULL(SUM(orders.amount), 0) as 'total_amount'
FROM customers
LEFT JOIN orders 
ON customers.customer_id = orders.customer_id
GROUP BY customers.first_name, customers.last_name
ORDER BY total_amount DESC;

       