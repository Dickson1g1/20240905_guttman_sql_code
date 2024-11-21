/*  Name:                     Date Created:
                              Date Modified:
  Purpose: This script creates a function and the then incorporates it into
  a stored procedure.
*/
SYSTEM CLS;
-- Opening print statement
SELECT 'LINE 09' AS 'Installation Startiong!!!';
SELECT USER() AS 'INSTALLATION USER';
-- Remove the database if they are already there!!


DROP DATABASE IF EXISTS my_testdb;

/* Create the databse after making sure it is
  not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS my_testdb
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default settings
-- of the database.
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created
SHOW DATABASES;

-- SELECT the database
USE my_testdb;

SELECT 'LINE 34' AS 'DATABSE CREATION COMPLETED',
        DATABASE() AS 'DATABASES NAME';
-- Add or replace the view
CREATE OR REPLACE VIEW vw_get_employee_dept
AS
  SELECT
      USER() AS 'Requested_BY',
      e.emp_no AS 'Employee',
      d.dept_no AS 'Department_Number',
      d.dept_name AS 'Department_Name',
      de.from_date AS 'dept_date',
      NOW() AS 'Day_Time'
  FROM
      employees.employees e
  JOIN
      employees.dept_emp de ON e.emp_no = de.emp_no
  JOIN
      employees.departments d ON de.dept_no = d.dept_no;

-- Display view
SELECT *
FROM vw_get_employee_dept
LIMIT 10;

-- Remove function if it already EXISTS
DROP FUNCTION IF EXISTS usf_get_max_date;
DELIMITER $$
CREATE FUNCTION IF NOT EXISTS usf_get_max_date(e_emp_no INT)
      RETURNS DATE DETERMINISTIC
BEGIN
      DECLARE v_get_max DATE;
      SELECT
          MAX(from_date)
      INTO v_get_max
      FROM
          employees.dept_emp
      WHERE
          emp_no = e_emp_no;

      RETURN v_get_max;
END$$
DELIMITER ;
-- use function from commad line
SELECT usf_get_max_date(10010);
-- Remove product if it is already there
DROP PROCEDURE IF EXISTS usp_get_employee_dept;

-- Create procedure
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS usp_get_employee_dept (IN e_emp_no INT)

BEGIN
    SELECT
        Requested_By AS 'Requested By',
        Employee,
        Department_Number AS 'Department Number',
        Department_Name AS 'Department Name',
        Day_Time AS 'Timestammp'
    FROM vw_get_employee_dept
    WHERE
        employee = e_emp_no
        AND
        dept_date =(SELECT usf_get_max_date(e_emp_no));
END//

-- DELIMITER ;

CALL usp_get_employee_dept(10010);
-- Completion Statement
SELECT
      'Installation' AS 'Completed',
      USER() AS 'BY',
      DATABASE() AS 'ON',
      NOW() AS 'AT';
