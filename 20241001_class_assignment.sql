/* SQL installation script: Creating User and Roles on MySQL
  Name: Dickson Boakye      Date Created:02/03/2024
                            Date Modificed:09/28/2024
  Purpose: This script creates user, create roles and configures their
            permissions
*/

SELECT '' AS 'Installation Starting!!!';

/* Remove the user if they are already there
*/

SELECT '' AS 'Dropping users';

DROP USER IF EXISTS 'guttman_root'@'localhost';
DROP USER IF EXISTS 'test_user_01'@'localhost';
DROP USER IF EXISTS 'test_user_02'@'localhost';
DROP USER IF EXISTS 'test_user_03'@'localhost';
DROP USER IF EXISTS 'test_user_04'@'localhost';
DROP USER IF EXISTS 'test_user_05'@'localhost';

SELECT '' AS 'Creating user';
-- Create a root user
CREATE USER IF NOT EXISTS  'guttman_root'@'localhost'
        IDENTIFIED BY  ''
        PASSWORD REQUIRE CURRENT;

-- Create test users
CREATE USER IF NOT EXISTS 'test_user_01'@'localhost'
        IDENTIFIED BY 'test_user_20241001'
-- Add some password settings
        FAILED_LOGIN_ATTEMPTS 4
        PASSWORD_LOCK_TIME 1
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'test_user_02'@'localhost'
        IDENTIFIED BY 'test_user_20241001'
-- Account Resource Limits
        WITH MAX_QUERIES_PER_HOUR 40
             MAX_UPDATES_PER_HOUR 10
             MAX_CONNECTIONS_PER_HOUR 75
             MAX_USER_CONNECTIONS 2
-- More restrictive password settings
        FAILED_LOGIN_ATTEMPTS 1
        PASSWORD_LOCK_TIME UNBOUNDED
        PASSWORD EXPIRE INTERVAL 30 DAY
        PASSWORD HISTORY 25
        PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'test_user_03'@'localhost'
          IDENTIFIED BY 'test_user_20241001';
CREATE USER IF NOT EXISTS 'test_user_04'@'localhost'
          IDENTIFIED BY 'test_user_20241001';
CREATE USER IF NOT EXISTS 'test_user_05'@'localhost'
          IDENTIFIED BY 'test_user_20241001';

-- DROP and Create roles
SELECT '' AS 'CREATING ROLES';
DROP  ROLE IF EXISTS  'read_only_employees_db',
                      'read_department-info';
CREATE ROLE IF NOT EXISTS 'read_only_employees_db',
                          'read_department-info';


SELECT '' AS 'Granting privileges';

-- Give the user root privileges
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD
    ON *.* TO 'guttman_root'@'localhost' WITH GRANT OPTION;

-- Give test user 01 full privileges to testdb_20240919
-- Give test user 01 SELECT privileges to only department table in
-- employees database

GRANT ALL PRIVILEGES
    ON testdb_20240919.* TO 'test_user_01'@'localhost';

GRANT SELECT
    ON employees.departments TO 'test_user_01'@'localhost';

-- Give test user 02 full privileges to all tables in employees database
GRANT ALL PRIVILEGES
    ON employees.* TO 'test_user_02'@'localhost';

/*Give SELECT to all tables in employees database for role
      read_only_employees_db
*/

GRANT SELECT
    ON employees.*
    TO 'read_only_employees_db';

/*Give SELECT to department tables in employees database for role
          read_department_info
*/
GRANT SELECT
    ON employees.department
    TO 'read_department_info';

GRANT 'read_only_employees_db'
      TO 'test_user_03'@'localhost';
GRANT 'read_department_info'
      TO  'test_user_04'@'localhost',
          'test_user_05'@'localhost';

/*To specify which roles should become active each time a user connects
 to the server and authenticates, use SET DEFAULT ROLE. To set the
 default to all assigned roles for each account create earlier, use
 this statement:
*/
SET DEFAULT ROLE ALL TO
      'test_user_03'@'localhost',
      'test_user_04'@'localhost',
      'test_user_05'@'localhost';

/* Verify that the use with the correct privilages has been
   properly created.
*/

SHOW GRANT FOR 'guttman_root'@'localhost';
SHOW GRANT FOR 'test_user_01'@'localhost';
SHOW GRANT FOR 'test_user_02'@'localhost';
SHOW GRANT FOR 'test_user_03'@'localhost' USING 'read_only_employees_db';
SHOW GRANT FOR 'test_user_04'@'localhost' USING 'read_department_info';
SHOW GRANT FOR 'test_user_05'@'localhost' USING 'read_department_info';

/* See all the users create
*/
SELECT user, show_db_priv, account_locked
FROM mysql.user;

/* Force MYSQL to update the changes to the user privilages
*/
FLUSH PRIVILEGES;

/* See all users created
*/

SELECT user, show_db_priv, account_locked
FROM mysql.user;
SELECT '' AS 'Installation Completed';
