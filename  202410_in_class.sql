/* Name:                     Date Created:
                            Date Modificed:
  Purpose:This script crestes a database, customers
  and orders table, and performs 7 SQL joins.
*/
SYSTEM CLS;
-- Opening print statement
SELECT 'LINE 8' AS 'Installation SCRIPT STARTING!!!';

SELECT USER() AS 'INSTALLATION USER';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20241017;

/* Create the database after cheacking making sure it is
  not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20241017
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default settings
-- of the database.
-- EXPLAIN CHARATER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created

SHOW DATABASES;
SELECT 'LINE 31' AS 'DATABASE CREATION COMPLETED';

-- Let's enter the database
USE testdb_20241017;

-- Let's create some tables
DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers(
    customer_id     INT    AUTO_INCREMENT,
    first_name      VARCHAR(30),

    PRIMARY KEY(customer_id)

);

SELECT 'LINE 46' AS 'CREATED TABLE';
SHOW TABLES;

DROP TABLE IF EXISTS order;
CREATE TABLE IF NOT EXISTS orders(
  order_id    INT AUTO_INCREMENT,
  amount      DECIMAL(7.2),
  customers   INT,

  PRIMARY KEY(order_id),
  FOREIGN KEY(customers) REFERENCES customers(customer_id)
);
SELECT 'LINE 58' AS 'CREATE TABLE';
SHOW TABLES;

INSERT INTO customers(first_name)
VALUES  ('John'),
        ('Robert'),
        ('David'),
        ('John'),
        ('Betty');
SELECT 'LINE 67' AS 'CUSTOMER DATA ADDED';

INSERT INTO orders(amount, customers)
VALUES  (500,(SELECT customer_id FROM customers WHERE first_name = 'David')),
        (200,(SELECT customer_id FROM customers WHERE first_name = 'Hector')),
        (600,(SELECT customer_id FROM customers WHERE first_name = 'Wendy')),
        (800,(SELECT customer_id FROM customers WHERE first_name = 'Betty'));

SELECT 'LINE 73' AS 'ORDERS DATA ADDED';
SELECT 'LINE 74' AS 'INNER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM  customer  c
JOIN orders o
ON c.customer_id = o.customers;

SELECT 'LINE 82' AS 'LEFT OUTER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM  customer  c
LEFT JOIN orders o
ON c.customer_id = o.customers;

SELECT 'LINE 88' AS 'LEFT JOIN EXCLUDING INNER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM  customer c
LEFT JOIN orders o
ON c.customer_id = o.customers
WHERE c.customer_id is NULL
  OR
      o.customers is NULL;

SELECT 'LINE 97' AS 'RIGHT OUTER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM  customer  c
RIGHT JOIN orders o
ON c.customer_id = o.customers;

SELECT 'LINE 103' AS 'RIGHT OUTER JOIN EXCLUDING INNER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM  customer c
RIGHT JOIN orders o
ON  c.customer_id = o.customers
WHERE c.customer_id is NULL
  OR
      o.customers is NULL;
