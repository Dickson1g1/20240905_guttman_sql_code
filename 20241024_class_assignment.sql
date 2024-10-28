/* SQL installation script
  Name:                     Date Created:
                            Date Modificed:
  Purpose:This script creates a my_testdb database, deliveries,order_info
  products, warehouse and orders table, and
  performs a number of select statements.
*/
SYSTEM CLS;
-- Opening print statement
SELECT 'LINE 08' AS 'Installation Starting!!!';
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
SELECT 'LINE 31' AS 'DATABASE CREATION COMPLETE';

-- Let's enter the database
USE my_testdb;

-- Let's create some tables
DROP TABLE IF EXISTS warehouses;
CREATE TABLE IF NOT EXISTS warehouses(
  warehouse_id        INT AUTO_INCREMENT,
  warehouse_location  VARCHAR(20),

  PRIMARY KEY(warehouse_id)
);

SELECT 'LINE 45' AS 'Table Created: warehouses';
DROP TABLE IF EXISTS deliveries;
CREATE TABLE IF NOT EXISTS deliveries(
  delivery_id         INT AUTO_INCREMENT,
  delivery_date       DATE,
  warehouse_id        INT,
  PRIMARY KEY(delivery_id)

);

SELECT 'LINE 55' AS 'Table Created: deliveries';
DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products(
  product_id          INT AUTO_INCREMENT,
  product_name        VARCHAR(20),
  product_price       INT,
  warehouse_id        INT,

  PRIMARY KEY(product_id)
);

SELECT 'LINE 66' AS 'Table Created: order_info';

DROP TABLE IF EXISTS order_info;
CREATE TABLE IF NOT EXISTS order_info(
  order_info_id          INT AUTO_INCREMENT,
  order_id               INT,
  product_id             INT,
  product_quantity       INT,

  PRIMARY KEY(order_info_id)
);

SELECT 'LINE 66' AS 'Table Created: order_info';

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
  order_id          INT AUTO_INCREMENT,
  order_date        DATE,
  order_info_id     INT,
  order_value       INT,
  order_currency    VARCHAR(10)
  PRIMARY KEY(order_id)

);

SELECT '91' AS 'Table Created: orders';

SHOW TABLES;

-- Now add missing FOREIGN KEYS
ALTER TABLE orders
ADD FOREIGN KEY(order_info_id) REFERENCES order_info(order_info_id);
SELECT 'LINE 98' AS 'ADDED FOREIGN KEY to orders table';

ALTER TABLE order_info
ADD FOREIGN KEY(product_id) REFERENCES products(product_id);
SELECT 'LINE 102' AS 'ADDED FOREIGN KEY to products table';

ALTER TABLE product
ADD FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id);
SELECT 'LINE 106' AS 'ADDED FOREIGN KEY to product table';

ALTER TABLE deliveries
ADD FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id);
SELECT 'LINE 110' AS 'ADDED FOREIGN KEY to deliveries table';

SHOW TABLES;
--Closing print statement
SELECT 'INFO' AS 'Installation Completed, checking for errors!!!';
