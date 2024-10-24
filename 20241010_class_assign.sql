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
CREATE TABLE IF NOT EXISTS student (
  student_id        INT AUTO_INCREMENT,
  first_name        VARCHAR(50) NOT NULL,
  last_name         VARCHAR(50) NOT NULL,
  phone             VARCHAR(20) NOT NULL,  -- Adjusted length for telephone

  PRIMARY KEY(student_id)
);


-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';


-- Let's create some tables
DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company (
  company_id        INT AUTO_INCREMENT,
  name              VARCHAR(30) NOT NULL,
  address           VARCHAR(100),
  email             VARCHAR(50),
  phone             VARCHAR(20),

  PRIMARY KEY(company_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';


-- Let's create some tables
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer (
  customer_id       INT AUTO_INCREMENT,
  first_name        VARCHAR(20) NOT NULL,
  last_name         VARCHAR(20) NOT NULL,
  age               INT,
  country           VARCHAR(50),

  PRIMARY KEY(customer_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';


-- Let's add some values
-- (You can add INSERT statements here if needed)
INSERT INTO company(name, address, email, phone)
VALUES
('Balboa Software', '475 E. Baker Street', 'customers@balboa.com', '834-4349'),
('Dynix Publishing', '7 North Plymouth St.', 'customer_service@dynix.com', '(733)508-1603'),
('EOS International', '56 Vine Road', 'customers@eos.com', '(438)496-9721'),
('Taylor & Francis', '73 E. High Point Road', 'customer_service@taylorfrancis.com', '222831-5041'),
('Faulkner Information Services', '132 W. 31st', 'customer_service@falkner.com', '352-5467'),
('Montgomery Fleet Equipment',' 7 South Wild Horse Dr.', 'service@fleetequip.com', '919-960-5818');

INSERT INTO student(first_name, last_name, phone)
VALUES
('Adam', 'White', '834-4349'),
('Darren', 'Addams', '(733)508-1603'),
('Debie', 'Allen', '(438)496-9721'),
('Monica', 'Kline', '222831-5041'),
('Raymond', 'Diaz', '352-5467'),
('Jacoby', 'Bradhaw', '919-960-5818'),
('Ahtony', 'Perl', '814-279-5654'),
('Thomas', 'Owen', '(222)831-4349'),
('Gayle', 'King', '732-963-7253'),
('devon', 'davis', '(814)717-5818');


INSERT INTO customer(first_name, last_name, age, country)
VALUES
('Adam', 'White', '22', 'India'),
('Darren', 'Addams', '31', 'Germany'),
('Debie', 'Allen', '54', 'Germany'),
('Monica', 'Kline', '18', 'USA'),
('Raymond', 'Diaz', '17', 'America'),
('Jacoby', 'Bradhaw', '20', 'Canada'),
('Ahtony', 'Perl', '32', 'Mexico'),
('Thomas', 'Owen', '23', 'America'),
('Gayle', 'King', '45', 'India'),
('devon', 'davis', '40', 'Italy');

UPDATE student
SET first_name = 'Adam', 'Darren', 'Debbie', 'Monica', 'Raymond', 'Jacob', 'Anthony', 'Thomas', 'Gayle', 'Devon'


SELECT '' AS 'INSTALLATION SCRIPT COMPLETED';
