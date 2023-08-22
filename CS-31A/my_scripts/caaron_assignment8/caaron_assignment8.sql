/* Assignment8.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/

/* put the database name into this command */
USE restaurant;


/* Query 1 */
/*
Question : Construct an inline view from the restaurant database that lists the last name, salary, department ID, and maximum salary for each department. 
Hint: One query will need to calculate maximum salary by department ID.
*/
SELECT s.last_name, s.salary, s.dept_id
FROM staff s, 
	(SELECT dept_id, MAX(salary) maxsalary
    FROM staff
    GROUP BY dept_id) d
WHERE s.dept_id = d.dept_id
AND s.salary = d.maxsalary
ORDER BY dept_id;

/* Query 2 */
/*
Question : Create a new table called my_departments and add all columns and all rows to it using a subquery 
from the departments table. Do a SELECT statement to confirm that you have all the columns and rows. 
Create or enable the department_id column as the primary key. 
*/
CREATE TABLE my_departments AS (SELECT * FROM departments);

ALTER TABLE my_departments
ADD CONSTRAINT my_departments_id_pk PRIMARY KEY(department_id);

DESCRIBE my_departments;

SELECT * 
FROM my_departments;

/* Query 3 */
/*
Question : Create a view called view_my_departments that includes: department_id and department_name.  
Add the following data to the my_departments table using view_my_departments. 
department_id     department_name  
105               Advertising  
120               Custodial  
130               Planning
*/
CREATE OR REPLACE VIEW view_my_departments
AS SELECT department_id, department_name
	FROM my_departments;

INSERT INTO view_my_departments(department_id, department_name)
VALUES (105, "Advertising");
INSERT INTO view_my_departments(department_id, department_name)
VALUES (120, "Custodial");
INSERT INTO view_my_departments(department_id, department_name)
VALUES (130, "Planning");

/* Query 4 */
/*
Question : Add the Human Resources department, department ID 220 to my_departments using 
view_my_departments.
Verify that the new additions to my_departments were added using view_my_departments. 
*/
INSERT INTO view_my_departments(department_id, department_name)
VALUES (220, "Human Resources");

SELECT *
FROM my_departments;

/* Query 5 */
/*
Question : Create a view named item_ordered. It consists of the food item number, item description, price, order 
number, order date, quantity, and price for all ordered food items currently on file. Write and execute the CREATE 
VIEW command to create the item_ordered view.   
*/
CREATE OR REPLACE VIEW item_ordered
AS SELECT item_number, description, price, order_number, quantity, order_date
	FROM food_items 
	JOIN order_lines USING (item_number)
	JOIN orders USING (order_number);

SELECT * FROM item_ordered;

/* Query 6 */
/*
Question : Write and execute the command to retrieve the item number, description, order number, and quoted 
price for all orders in the item_ordered view for food items with prices that exceed $5.   
*/
SELECT item_number, description, order_number, price
FROM item_ordered 
WHERE price > 5
ORDER BY order_number;

/* Query 7 */
/*
Question : Create a view named salary_view that returns the highest salary, lowest salary, average salary, and 
department name.     
*/ 
CREATE OR REPLACE VIEW salary_view
AS SELECT d.department_name, MAX(s.salary) AS "Highest Salary", MIN(s.salary) AS "Lowest Salary", AVG(s.salary) AS "Average Salary"
	FROM departments d JOIN staff s ON (d.department_id = s.dept_id)
	GROUP BY department_name;

SELECT * 
FROM salary_view;

/* Query 8 */
/*
Question : Create a view named dept_managers_view that returns a listing of department names along with the 
manager initial and surname for that department. Test the view by returning all the rows from it. Make sure no 
rows can be updated through the view. 
*/
CREATE OR REPLACE VIEW dept_managers_view
AS SELECT d.department_name, CONCAT(SUBSTR(s.first_name, 1, 1), '. ', s.last_name) AS "Manager"
	FROM departments d 
	JOIN staff s ON (d.department_id = s.dept_id)
	WHERE s.staff_id = d.manager_id
    GROUP BY d.department_name;

UPDATE  dept_managers_view
SET manager = "C. Landon"
WHERE department_name = "Administration"; 

UPDATE dept_managers_view
SET department_name = "IT"
WHERE manager = "J. Nolan";

SELECT * 
FROM dept_managers_view;