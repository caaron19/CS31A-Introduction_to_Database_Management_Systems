/* Assignment6.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/

/* put the database name into this command */
USE restaurant;

/* Query 1 */
-- Question : Write a SELECT statement that finds the average salary for International Foods Restaurant (IFR) employees whose manager ID is 200. 
SELECT AVG(salary) Average
FROM staff
WHERE manager_id = 200;

/* Query 2 */
/*
Question : Write a SELECT statement that finds the lowest salary, the last name who is first in an alphabetical list of employees, 
and the last name who is last of an alphabetical list of employees. Select only employees who are in departments 30 or 60.
*/
SELECT MIN(salary), MIN(last_name), MAX(last_name) 
FROM staff
WHERE dept_id = 30 OR dept_id = 60
ORDER BY last_name;

/* Query 3 */
-- Question : Write a SELECT statement that finds what the most recent hire date of an IFR employee was. 
SELECT MAX(hire_date) AS "Most Recent Hire"
FROM staff;

/* Query 4 */
/*
Question : Write a SQL statement that creates a list including each employee's first name concatenated to a space as well as the employee's last name, 
and the salary of all employees whose last name contains the string 'ar'. 
*/
SELECT CONCAT(first_name, ' ' , last_name) AS "Employee Name", salary
FROM staff
WHERE last_name LIKE '%ar%'
GROUP BY salary
ORDER BY salary;

/* Query 5 */
-- Question : Write a SQL statement that lists the item number and item description for all items. The item descriptions should appear in uppercase letters. 
SELECT item_number, UPPER(description) AS "item_desc"
FROM food_items;

/* Query 6 */
/*
Question : FR is running a promotion that is valid for up to 20 days after an order is placed. Write a SQL statement that lists the order ID, customer ID, first name, and last name. 
The promotion date is 20 days after the order was placed.   
*/
SELECT os.order_number, cs.customer_id, cs.first_name, cs.last_name, os.order_date, ADDDATE(order_date, INTERVAL 20 DAY) AS promotion_date
FROM orders os
JOIN customers cs ON os.cust_id = cs.customer_id
ORDER BY os.order_number;

/* Query 7 */
-- Question : List the last names and birthdays of IFR employees. Convert the birth dates to character data.  
SELECT last_name, DATE_FORMAT(birthdate, '%W %M %D %Y') Birthday
FROM staff;

/* Query 8 */
/*
Question : Layla Justin is an employee who has received a $2,000 raise. Display her first name, last name, current salary, and new salary. 
Display both salaries with a $ and two decimal places. Label his new salary column AS New Salary. 
*/
SELECT first_name, last_name, LPAD(FORMAT(salary, 2), 9, '$') AS "Current Salary", LPAD(FORMAT(salary + 2000, 2), 9, '$') AS "New Salary"
FROM staff
WHERE first_name = 'Layla' AND last_name = 'Justin';


/* Query 9 */
-- Question : Create a report listing the first and last names and month of hire for all employees in the staff table. 
SELECT CONCAT(first_name, ' ' ,last_name) Name, MONTHNAME(hire_date) AS "Month of Hire"
FROM staff;

/*  Query 10 */
-- Question : Write a SELECT statement that displays the item number and the number of orders placed for each item. Show the results in decreasing order and label result column NumOrders. 
SELECT item_number, COUNT(quantity) AS NumOrders
FROM order_lines
GROUP BY item_number
ORDER BY NumOrders DESC;

/*  Query 11 */
/*
Question : Write a SQL statement that creates a list of monthly salaries from the staff table where the salary is between $700 and $3,000. 
The salaries should be formatted to include a $-sign and have two decimal points like: $9999.99.  
*/
SELECT staff_id, LPAD(FORMAT(salary, 2), 9, '$') AS "monthly salary"
FROM staff
WHERE salary BETWEEN 700 AND 3000;