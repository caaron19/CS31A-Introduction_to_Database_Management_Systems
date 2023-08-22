/* Assignment3.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/

/* put the database name into this command */
USE restaurant;

/* FOOD ITEMS */

/* Query 1 */
-- Question : Write a query that displays the food item number and description of all food items with a name that begins with ‘S’. Use an appropriate alias for your column headings.
SELECT item_number AS "item id", description AS "item name"
FROM  food_items
WHERE description LIKE 'S%';

/* Query 2 */
-- Question : Write a query that uses the IN operator to list the food item number and description of each item where description is Hamburger or Chicken McNuggets.
SELECT item_number, description
FROM food_items
WHERE description IN ('Hamburger','Chicken McNuggets');

/* Query 3 */
-- Question : Use a search pattern to find all food item names with 'p' as the second letter and 'c' as the fourth letter. List each food item number, price, and description. Sort the list by food item number in descendingorder.
SELECT item_number, description, price
FROM food_items
WHERE description LIKE '_p_c%'
ORDER BY item_number DESC;

/* Query 4 */
-- Question : List the item number and description of each food item that is not in item number 81.
SELECT item_number, description
FROM food_items
WHERE NOT (item_number = 81);

/* Query 5 */
-- Question : List the food item number and description of all food items that are in item number 82 or 83 and contain the word “Chicken” in the description.
SELECT item_number, description
FROM food_items
WHERE description LIKE '%Chicken%' AND (item_number = 82 OR item_number = 83);

/* STAFF */
/* Query 6 */
-- Question : Display the first name, last name, and salary of all International Foods Restaurant staff whose salary is between $1000.00 and $3000.00 per month.
SELECT first_name, last_name, salary
FROM staff
WHERE salary BETWEEN 1000.00 AND 3000.00;

/* Query 7 */
-- Question : Display the last names of all International Foods Restaurant employees who have 'e' and 'n' in their last names.
SELECT last_name
FROM staff
WHERE last_name LIKE '%e%n%' OR last_name LIKE '%n%e%';

/* Query 8 */
-- Question : Display the last names of all International Foods Restaurant employees who make a monthly salary that is more than $4,000 and their job ID is not S_MGR.
SELECT last_name
FROM staff
WHERE NOT (job_id = 'S_MGR') AND salary > 4000.00;

/* Query 9 */
-- Question : Using the stafftable, write a query that displays all employees whose last names start with 'R' and have 'a' and 'e' anywhere in their last name.
SELECT last_name
FROM staff
WHERE last_name LIKE 'R%a%e%';

/*  Query 10 */
-- Question : Write a query that displays all employees who DO NOT earn exactly $3400, $3000, or $6000 and whose first name begins with the letter 'S'. Display each employee's first name, last name, and salary.
SELECT first_name, last_name, salary
FROM staff
WHERE NOT (salary = 3400.00 OR salary = 3000.00 OR salary = 6000.00) AND first_name LIKE 'S%';

/* CUSTOMERS */
/*  Query 11 */
-- Question : Write a query that displays the rows from the customer table where the customer number is between 15 and 25. Display each customer’s last name, first name, and customer number.
SELECT last_name, first_name, customer_id
FROM customers
WHERE customer_id BETWEEN 15 AND 25;

