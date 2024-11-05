/* SQL installation script: Creating User and Roles on MySQL
  Name: Dickson Boakye      Date Created:10/31/2024
                            Date Modificed:
  Purpose: This script creates user, create roles and configures their
            permissions
*/

SELECT '' AS 'Installation Starting!!!';

/* Remove the user if they are already there
*/

SELECT '' AS 'Dropping users';

DROP USER IF EXISTS 'prj_root'@'localhost';
DROP USER IF EXISTS 'prj_user_01'@'localhost';
DROP USER IF EXISTS 'prj_user_02'@'localhost';
DROP USER IF EXISTS 'prj_user_03'@'localhost';


SELECT '' AS 'Creating user';
-- Create a root user
CREATE USER IF NOT EXISTS  'prj_root'@'localhost'
        IDENTIFIED BY  'project_2024'
        PASSWORD REQUIRE CURRENT;

-- Create test users
CREATE USER IF NOT EXISTS 'prj_user_01'@'localhost'
        IDENTIFIED BY 'prj_user_20241031'
-- Add some password settings
        FAILED_LOGIN_ATTEMPTS 0
        PASSWORD_LOCK_TIME 0
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'prj_user_02'@'localhost'
        IDENTIFIED BY 'prj_user_20241031'
-- Add some password settings
        FAILED_LOGIN_ATTEMPTS 0
        PASSWORD_LOCK_TIME 1
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'prj_user_03'@'localhost'
        IDENTIFIED BY 'prj_user_20241031'
-- Add some password settings
        FAILED_LOGIN_ATTEMPTS 4
        PASSWORD_LOCK_TIME UNBOUNDED
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

-- DROP and Create roles
SELECT '' AS 'CREATING ROLES';
DROP  ROLE IF EXISTS  'read_only_classicmodels_db',
                      'read_all_employees_db';

CREATE ROLE IF NOT EXISTS 'read_only_classicmodels_db',
                          'read_all_employees_db';

SELECT '' AS 'Granting privileges';

-- Give the prj_user_01 privilages
GRANT  INSERT, UPDATE
  ON employees.* TO 'prj_user_01'@'localhost' WITH GRANT OPTION;

SELECT '' AS 'Privilages for prj_user_01 Created';

-- Give the prj_user_02 privilages
GRANT read_only_classicmodels_db TO 'prj_user_02'@'localhost';

SELECT '' AS 'Privilages for prj_user_02 Created';

-- Give the prj_user_03 privilages
GRANT read_only_employees_db TO 'prj_user_03'@'localhost';

SELECT '' AS 'Privilages for prj_user_03 Created';

SELECT user, show_db_priv, account_locked
FROM mysql.user;
SELECT '' AS 'Installation Completed';
