/* SQL installation script
  Name:                     Date Created:
                            Date Modified:
  Purpose:

*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';


-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20240919;


-- Create the database after checking to make sure it is not already there
CREATE DATABASE IF NOT EXISTS testdb_20240919
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS '###############################';


-- Let's enter the database
USE testdb_20240919;


-- Let's create some tables


-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';

DROP TABLE IF EXISTS order_info;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS warehouse;

CREATE TABLE warehouse(
    warehouse_id           INT AUTO_INCREMENT,
    warehouse_location     VARCHAR(20),
    PRIMARY KEY(warehouse_id)
);

CREATE TABLE deliveries(
    delivery_id     INT AUTO_INCREMENT,
    delivery_date   DATE,
    warehouse_id    INT,
    PRIMARY KEY(delivery_id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id)
);

CREATE TABLE product(
    product_id       INT AUTO_INCREMENT,
    product_name     VARCHAR(20),
    product_price    INT,
    warehouse_id     INT,
    PRIMARY KEY(product_id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id)
);

CREATE TABLE order_info(
    order_info_id        INT AUTO_INCREMENT,
    product_id           INT,
    product_quantity     INT,
    PRIMARY KEY(order_info_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

CREATE TABLE orders(
    order_id        INT AUTO_INCREMENT,
    order_date      DATE,
    order_info_id   INT,
    order_value     INT,
    order_currency  VARCHAR(10),
    PRIMARY KEY(order_id),
    FOREIGN KEY(order_info_id) REFERENCES order_info(order_info_id)
);
