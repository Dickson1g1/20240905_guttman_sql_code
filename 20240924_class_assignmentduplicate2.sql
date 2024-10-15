/* SQL installation script
  Name:                     Date Created:
                            Date Modified:
  Purpose:

*/

SYSTEM CLS;
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';

SELECT USER() AS 'INSTALL USER';

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
DROP TABLE IF EXISTS CUSTOMER;  -- Corrected spelling from CUSTORMER to CUSTOMER
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

CREATE TABLE CUSTOMER(
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
    ProductName      VARCHAR(40),  -- Capitalized for consistency
    SupplierId       INT,
    UnitPrice        DECIMAL(10, 4),
    Package          VARCHAR(50),
    IsDiscontinued   ENUM('Y', 'N') DEFAULT 'N',  -- Fixed quotes
    PRIMARY KEY(ProductId),
    FOREIGN KEY(SupplierId) REFERENCES SUPPLIER(SupplierId)
);

CREATE TABLE `ORDER`(
    OrderId          INT AUTO_INCREMENT,
    OrderDate        DATE,  -- Corrected from OrderData to OrderDate for clarity
    CustomerId       INT,
    TotalAmount      DECIMAL(10, 2),  -- Changed to DECIMAL for currency
    PRIMARY KEY(OrderId),
    FOREIGN KEY(CustomerId) REFERENCES CUSTOMER(CustomerId)
);

CREATE TABLE ORDERITEM(
    OrderItemId      INT AUTO_INCREMENT,  -- Capitalized for consistency
    OrderId          INT,
    ProductId        INT,
    UnitPrice        DECIMAL(10, 2),  -- Changed to DECIMAL for currency
    Quantity         INT,
    PRIMARY KEY(OrderItemId),
    FOREIGN KEY(OrderId) REFERENCES `ORDER`(OrderId),
    FOREIGN KEY(ProductId) REFERENCES PRODUCT(ProductId)
);
