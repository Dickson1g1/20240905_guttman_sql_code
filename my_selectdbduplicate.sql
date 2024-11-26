/* SQL installation script
  Name: Class Project 1                     Date Created:
                                           Date Modified:
  Purpose:


*/

SYSTEM CLS;

-- Opening print statement
SELECT '' AS 'Installation Starting!!!';

SELECT USER() AS 'INSTALL USER';


-- Remove the database if it is already there
DROP DATABASE IF EXISTS my_project_db1;


-- Create the database
CREATE DATABASE IF NOT EXISTS my_project_db1
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';


-- Enter the database
USE my_project_db1;


-- Drop tables if they exist
DROP TABLE IF EXISTS soldvia;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS salestransaction;
DROP TABLE IF EXISTS vendor;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS region;


-- Create tables
CREATE TABLE region (
    regionId CHAR(1) NOT NULL,
    regionname VARCHAR(25),
    PRIMARY KEY(regionId)
);

CREATE TABLE store (
    storeId VARCHAR(3) NOT NULL,
    storezip CHAR(15),
    regionId CHAR(1),
    PRIMARY KEY(storeId),
    FOREIGN KEY(regionId) REFERENCES region(regionId)
);

CREATE TABLE customer (
    customerId CHAR(7) NOT NULL,
    customername VARCHAR(15),
    customerzip CHAR(5),
    PRIMARY KEY(customerId)
);

CREATE TABLE category (
    categoryId CHAR(2) NOT NULL,
    categoryname VARCHAR(25),
    PRIMARY KEY(categoryId)
);

CREATE TABLE vendor (
    vendorId CHAR(2) NOT NULL,
    vendorname VARCHAR(25),
    PRIMARY KEY(vendorId)
);

CREATE TABLE salestransaction (
    tId VARCHAR(8) NOT NULL,
    customerId CHAR(7),
    storeId VARCHAR(3),
    tdate DATE,
    PRIMARY KEY(tId),
    FOREIGN KEY(customerId) REFERENCES customer(customerId),
    FOREIGN KEY(storeId) REFERENCES store(storeId)
);

CREATE TABLE product (
    productId CHAR(3) NOT NULL,
    productname VARCHAR(25),
    productprice DECIMAL(7, 2),
    vendorId CHAR(2),
    categoryId CHAR(2),
    PRIMARY KEY(productId),
    FOREIGN KEY(vendorId) REFERENCES vendor(vendorId),
    FOREIGN KEY(categoryId) REFERENCES category(categoryId)
);

CREATE TABLE soldvia (
    soldviaId INT AUTO_INCREMENT,
    productId CHAR(3) NOT NULL,
    tId VARCHAR(8) NOT NULL,
    noofitems INT,
    PRIMARY KEY(soldviaId),
    FOREIGN KEY(productId) REFERENCES product(productId),
    FOREIGN KEY(tId) REFERENCES salestransaction(tId)
);


-- INSERTING DATA

SELECT * FROM salestransaction; -- to see all the data in the table

INSERT INTO category(categoryId, categoryname)
VALUES  ('CP', 'Camping'),
        ('FW', 'Footwear');

SELECT * FROM category; -- to see all the data in the table

INSERT INTO region(regionId, regionname)
VALUES  ('C', 'Chicagoland'),
        ('T', 'Tristate');

SELECT * FROM region; -- to see all the data in the table

INSERT INTO vendor(vendorId, vendorname)
VALUES  ('PG', 'Pacifica Gear'),
        ('MK', 'Mountain King');

SELECT * FROM vendor; -- to see all the data in the table

INSERT INTO customer(customerId, customername, customerzip)
VALUES  ('1-2-333', 'Tina', '60137'),
        ('2-3-444', 'Tony', '60611'),
        ('3-4-555', 'Pam', '35401');

SELECT * FROM customer; -- to see all the data in the table

INSERT INTO store(storeId, storezip, regionId)
VALUES  ('s1', '60600', 'C'),
        ('s2', '60605', 'C'),
        ('s3', '35400', 'T');

SELECT * FROM store; -- to see all the data in the table

INSERT INTO product (productId, productname, productprice, vendorId, categoryId)
VALUES  ('1X1', 'Zzz Bag', 100, 'PG', 'CP'),
        ('2X2', 'Easy Boot', 70, 'MK', 'FW'),
        ('3X3', 'Cosy Sock', 15, 'MK', 'FW'),
        ('4X4', 'Dura Boot', 90, 'PG', 'FW'),
        ('5X5', 'Tiny Tent', 150, 'MK', 'CP'),
        ('6X6', 'Biggy Tent', 250, 'MK', 'CP');
SELECT * FROM product; -- to see all the data in the table

INSERT INTO soldvia (productId, tId, noofitems)
VALUES  ('1X1', 'T111', 1),
        ('2X2', 'T222', 1),
        ('3X3', 'T333', 5),
        ('1X1', 'T333', 1),
        ('4X4', 'T444', 1),
        ('2X2', 'T444', 2),
        ('4X4', 'T555', 4),
        ('5X5', 'T555', 2),
        ('6X6', 'T555', 1);

SELECT * FROM soldvia; -- to see all the data in the table

-- Show all tables at the end
SHOW TABLES;
