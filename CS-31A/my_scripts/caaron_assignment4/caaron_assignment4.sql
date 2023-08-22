/* Assignment4.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/

/* put the database name into this command */
USE restaurant;

/* Query 1 */
-- Question : Write the CREATE TABLE statement for the International Foods Restaurant global locations table. Define the constraints at the column level.
CREATE TABLE global_locations(
id INT(4) NOT NULL PRIMARY KEY,
loc_name VARCHAR(20) NOT NULL,
address VARCHAR(20),
city VARCHAR(20),
zip_postal_code VARCHAR(20),
phone VARCHAR(15),
email VARCHAR(15) NOT NULL UNIQUE,
manager_id INT(4),
emergency_contact VARCHAR(20)
)ENGINE = INNODB;

DESCRIBE global_locations;

/* Query 2 */
-- Question : Rewrite the CREATE TABLE statement for the International Foods Restaurant locations table to define the UNIQUE constraints at the table level. Do not execute this statement. 
/*
CREATE TABLE global_locations(
id INT(4) NOT NULL PRIMARY KEY,
loc_name VARCHAR(20) NOT NULL,
address VARCHAR(20),
city VARCHAR(20),
zip_postal_code VARCHAR(20),
phone VARCHAR(15),
email VARCHAR(15) NOT NULL,
manager_id INT(4),
emergency_contact VARCHAR(20),
UNIQUE (email)
)ENGINE = INNODB;
*/

/* Query 3 */
-- Question : Alter the global_locations table to add a column that stores the dateof open location. 
ALTER TABLE global_locations
ADD date_opened DATE;

/* Query 4 */
-- Question : Display column names and datatypes for the global_locations table.
DESCRIBE global_locations;

/* Query 5 */
-- Question : Delete the date_opened column from the global_locationstable.
ALTER TABLE global_locations
DROP COLUMN date_opened;

/* Query 6 */
-- Question : Rename the global_locationstable as global_locations_backup.
RENAME TABLE global_locations
TO global_locations_backup;

/* Query 7 */
-- Question : Write an INSERT statement that adds this row to the customers table:
INSERT INTO customers (customer_ID, first_name, last_name, phone_number, address, city, state, zip)
VALUES (60, 'brian', 'rogers', '01654564898', '820 Bounty Drive', 'Palo Alto', 'CA', '94342');

/* Query 8 */
-- Question : Create the three o_tables (jobs, employees, and departments) using the syntax:
CREATE TABLE o_jobs AS (SELECT * FROM jobs);
CREATE TABLE o_staff AS (SELECT staff_id, first_name, last_name, email, hire_date, job_id FROM staff);
CREATE TABLE o_departments AS (SELECT * FROM departments); 

/* Query 9 */
-- Question : Write an INSERT statement that adds the Human Resources job to the o_jobs table:
INSERT INTO o_jobs (job_id, job_title, min_salary, max_salary)
VALUES ('hr_man', 'human resources manager', 4500, 5500);

/*  Query 10 */
-- Question : Rename the o_jobs table to o_job_description.
RENAME TABLE o_jobs
TO o_job_description;

/*  Query 11 */
-- Question : Three new employees hired for this department are shown in the table. Add them to the o_staff table.Each employee will need an email address created from the first letter of the employee’s first name combined with the employee’s last name (Bob Smith would be BSMITH). 
INSERT INTO o_staff (staff_id, first_name, last_name, email, hire_date, job_id)
VALUES (210, 'Ramon', 'Sanchez', 'RSANCHEZ', CURDATE(), 'HR_MAN');
INSERT INTO o_staff (staff_id, first_name, last_name, email, hire_date, job_id)
VALUES (211, 'Tai', 'Sugita', 'TSUGITA', CURDATE(), 'HR_MAN');
INSERT INTO o_staff (staff_id, first_name, last_name, email, hire_date, job_id)
VALUES (212, 'Alina', 'Arcos', 'AARCOS', CURDATE(), 'HR_MAN');

/*  Query 12 */
-- Question : Create a copy of the staff table and call it your_initials_emp. Add a column to the new table called department_name, and make this column the same data type and length as the department_namecolumn in the departments table. Display the names of the tables in your current database.
CREATE TABLE C_A_emp LIKE staff;
ALTER TABLE C_A_emp
ADD department_name VARCHAR(30);
 
SHOW TABLES;
 
/*  Query 13 */
-- Question : Remove the global_locations_backup table from the database. Display the names of the tables in your current database.
DROP TABLE global_locations_backup;

SHOW TABLES;