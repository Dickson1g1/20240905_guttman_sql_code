/* Name:                     Date Created:
                            Date Modificed:
  Purpose:This script crestes a database, customers
  and orders table, and performs a number of select statements.
*/
SYSTEM CLS;
-- Opening print statement
SELECT 'LINE 8' AS 'Installation SCRIPT STARTING!!!';

SELECT USER() AS 'INSTALLATION USER';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS my_testdb;

/* Create the database after cheacking making sure it is
  not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS my_testdb
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
USE my_testdb;

-- Let's create some tables
DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers(
    customer_id     INT    AUTO_INCREMENT,
    first_name      VARCHAR(30),
    last_name       VARCHAR(30),
    age             INT,
    country         VARCHAR(3),

    PRIMARY KEY(customer_id)

);

SELECT 'LINE 46' AS 'CREATED TABLE';
SHOW TABLES;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
  order_id    INT AUTO_INCREMENT,
  amount      DECIMAL(7.2),
  customers   INT,

  PRIMARY KEY(order_id),
  FOREIGN KEY(customers) REFERENCES customers(customer_id)
);
SELECT 'LINE 61' AS 'CREATED TABLE';
SHOW TABLES;

INSERT INTO customers(first_name,last_name,age,country)
VALUES  ('John','Doe',31,'USA'),
        ('Robert','Luna',22,'USA'),
        ('David','Robinson',22,'UK'),
        ('John','Reinhardt',25,'UK'),
        ('Betty','Doe',28,'UAE'),
        ('Davante','',22,'JAM'),
        ('Alexis','  ',31,'CAN');

-- Put in NULL entry
INSERT INTO customers(first_name,age,country)
VALUES  ('Migel',40,'MEX');

SELECT 'LINE 71' AS 'CUSTOMER DATA ADDED';

SELECT 'LINE 73' AS 'SELECT ALL';
SELECT * FROM customers;

SELECT 'LINE 76' AS 'WHERE STATEMENT';
SELECT first_name, last_name
FROM  customers
WHERE last_name = 'Doe';

SELECT 'LINE 87' AS 'AND STATEMENT';
SELECT first_name, last_name, country
FROM  customers
WHERE country = 'USA'
AND
      last_name = 'Doe';

SELECT 'LINE 89' AS 'OR STATEMENT';
SELECT first_name, last_name, country
FROM  customers
WHERE country = 'USA'
OR
      last_name = 'Doe';

SELECT 'LINE 96' AS 'NOT STATEMENT';
SELECT first_name, last_name
FROM  customers
WHERE NOT country = 'USA';

SELECT 'LINE 101' AS 'UNIQUE STATEMENT';
SELECT DISTINCT age
FROM  customers;

SELECT 'LINE 107' AS 'IS NULL';
SELECT first_name, last_name, country
FROM  customers
WHERE last_name is NULL;

SELECT 'LINE 107' AS 'IS NOT NULL';
SELECT first_name, last_name, country
FROM  customers
WHERE last_name is NOT NULL;

SELECT 'LINE 117' AS 'COMBINE COLUMN WITH ALLAS';
SELECT concat(first_name,' ', last_name) AS 'Customer Name', country
FROM  customers;

SELECT 'LINE 124' AS 'COUNT THE ROWS';
SELECT COUNT(*)
FROM  customers;

SELECT 'LINE 128' AS "CAN'T COUNT NULLS";
SELECT COUNT(last_name)
FROM  customers;

SELECT 'LINE 132' AS 'MULTIPLE ENTRIES';
SELECT first_name, last_name, country
FROM  customers
WHERE country IN ('USA','UK','UAE');


SELECT 'CHECK FOR ERRORS' AS 'SQL SCRIPT COMPLETE!!';
