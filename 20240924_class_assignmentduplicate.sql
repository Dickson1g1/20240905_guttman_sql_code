/* SQL installation script
  Name:                     Date Created:
                            Date Modificed:
  Purpose:
*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20240924;

/* Create the database after cheacking making sure it is
  not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20240924
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default settings
-- of the database.
-- EXPLAIN CHARATER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS '###############################';

-- Let's enter the database
USE testdb_20240924;

-- Let's create some tables

-- Closing print statement
SELECT '' AS 'Installation Completed, cheack for errors!!!';

DROP TABLE IF EXISTS ORDERITEM;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS ORDER;
DROP TABLE IF EXISTS CUSTORMER;
DROP TABLE IF EXISTS SUPPLIER;

CREATE TABLE ORDERITEM(
        OrderitemId        INT     AUTO_INCREMENT,
        OrderId             INT,
        ProductId           INT,
        UntiPrice           INT,
        Ouantity            INT,

        PRIMARY KEY(OrderitemId),
        FOREIGN KEY(OrderId) REFERENCES ORDER(OrderId)
        FOREIGN KEY(ProductId) REFERENCES PRODUCT(ProductId)
);
CREATE TABLE PRODUCT(
        ProductId             INT  AUTO_INCREMENT,
        productName           VARCHAR(20),
        SupplierId            INT,
        UntiPrice             INT,
        Package               INT,
        IsDiscontinued        INT,

        PRIMARY KEY(ProductId),
        FOREIGN KEY(SupplierId) REFERENCES SUPPLIER(SupplierId)
);
CREATE TABLE ORDER(
        OrderId          INT    AUTO_INCREMENT,
        OrderData        DATE,
        CustomerId       INT,
        TotalAmount      INT,

        PRIMARY KEY(OrderId),
        FOREIGN KEY(CustomerId) REFERENCES CUSTORMER(CustomerId)
);
CREATE TABLE CUSTORMER(
        CustomerId             INT     AUTO_INCREMENT,
        FirstName        VARCHAR(20),
        LastName         VARCHAR(20),
        City             VARCHAR(20),
        Country          VARCHAR(20),
        Phone            INT,

        PRIMARY KEY(CustomerId)

);
CREATE TABLE SUPPLIER(
        SupplierId       INT AUTO_INCREMENT,
        CompanyName      VARCHAR(20),
        ContactName      VARCHAR(20),
        City             VARCHAR(20),
        Country          VARCHAR(20),
        Phone            INT,
        Fax              INT,


        PRIMARY KEY(SupplierId),
);
