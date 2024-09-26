/* SQL installation script
  Name:                     Date Created:
                            Date Modified:
  Purpose:

*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';


-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20240924;


-- Create the database after checking to make sure it is not already there
CREATE DATABASE IF NOT EXISTS testdb_20240924
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS '###############################';


-- Let's enter the database
USE testdb_20240924;


-- Let's create some tables


-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';

DROP TABLE IF EXISTS ORDERITEM;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS `ORDER`;  -- Use backticks for reserved keywords
DROP TABLE IF EXISTS CUSTORMER;
DROP TABLE IF EXISTS SUPPLIER;

CREATE TABLE SUPPLIER(
    SupplierId       INT AUTO_INCREMENT,
    CompanyName      VARCHAR(255),
    ContactName      VARCHAR(30),
    City             VARCHAR(15),
    Country          VARCHAR(15),
    Phone            VARCHAR(24),
    Fax              VARCHAR(24),
    PRIMARY KEY(SupplierId)
);

CREATE TABLE CUSTORMER(
    CustomerId       INT AUTO_INCREMENT,
    FirstName        VARCHAR(20),
    LastName         VARCHAR(30),
    City             VARCHAR(15),
    Country          VARCHAR(15),
    Phone            VARCHAR(24),
    PRIMARY KEY(CustomerId)
);

CREATE TABLE PRODUCT(
    ProductId        INT AUTO_INCREMENT,
    productName      VARCHAR(40),
    SupplierId       INT,
    UnitPrice        DECIMAL(10,4),
    Package          VARCHAR(50),
    IsDiscontinued   ENUM('Y', 'N') DEFAULT 'N',
    PRIMARY KEY(ProductId),
    FOREIGN KEY(SupplierId) REFERENCES SUPPLIER(SupplierId)
);

CREATE TABLE `ORDER`(
    OrderId          INT AUTO_INCREMENT,
    OrderData        DATE,
    CustomerId       INT,
    TotalAmount      INT,
    PRIMARY KEY(OrderId),
    FOREIGN KEY(CustomerId) REFERENCES CUSTORMER(CustomerId)
);

CREATE TABLE ORDERITEM(
    OrderitemId      INT AUTO_INCREMENT,
    OrderId          INT,
    ProductId        INT,
    UnitPrice        INT,
    Quantity         INT,
    PRIMARY KEY(OrderitemId),
    FOREIGN KEY(OrderId) REFERENCES `ORDER`(OrderId),
    FOREIGN KEY(ProductId) REFERENCES PRODUCT(ProductId)
);
