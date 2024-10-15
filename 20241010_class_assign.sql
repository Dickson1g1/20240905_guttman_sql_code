/*  Name:                     Date Created:
                            Date Modificed:
  Purpose:This script create a temporary database and
  performs inserts, updates and deletes
*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20241010;

/* Create the database after cheacking making sure it is
  not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20241010
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default settings
-- of the database.
-- EXPLAIN CHARATER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created

SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';

-- Let's enter the database
USE testdb_20241010;

-- Let's create some tables
DROP TABLE IF EXISTS student;
CREATE TABLE IF NOT EXISTS student(
  student_id        INT   AUTO_INCREMENT,
  first_name        VARCHAR(50) NOT NULL,
  last_name         VARCHAR(50) NOT NULL,
  telephone         VARCHAR(10) NOT NULL,

  PRIMARY KEY(student_id)
);


-- Let's see if the table has been create
SHOW TABLE;
SELECT '' AS 'TABLE CREATION COMPLETED';
-- Let's create some tables
DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company(
  company_id        INT   AUTO_INCREMENT,
  name                VARCHAR(20) NOT NULL,
  address             VARCHAR(100),
  email               VARCHAR(50),
  phone               VARCHAR(10),

  PRIMARY KEY(company_id)
);

SHOW TABLE;
SELECT '' AS 'TABLE CREATION COMPLETED';
-- Let's create some tables
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
  customer_id         INT  AUTO_INCREMENT,
  first_name          VARCHAR(20) NOT NULL,
  last_name           VARCHAR(20) NOT NULL,
  age                 INT,
  Country             VARCHAR(50),


  PRIMARY KEY(customer_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';

-- Let's add some values


SELECT '' AS 'INSTALLATION SCRIPT COMPLETED';
