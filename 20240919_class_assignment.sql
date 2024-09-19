/* SQL installation script
  Name:                     Date Created:
                            Date Modificed:
  Purpose:
*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20240919;

/* Create the database after cheacking making sure it is
  not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20240919
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
USE testdb_20240919;

-- Let's create some tables

-- Closing print statement
SELECT '' AS 'Installation Completed, cheack for errors!!!';
CREATE TABLE orders(
        order_id        INT     AUTO_INCREMENT,
        order_date      DATE,
        order_info_id   INT,
        order_value     INT,
        order_currency  VARCHAR(10),

        PRIMARY KEY(order_id),
        FOREIGN KEY(order_info_id) REFERENCES order_info(order_info_id)
);
