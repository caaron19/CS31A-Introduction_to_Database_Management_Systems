/* Assignment5.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/

/* put the database name into this command */
USE restaurant;

/* Query 1 */
-- Question : For  each  order,  write  a  SQL  statement  that  displays  the  order  ID  and  order  date  along  with  the customer ID, first name, and last name of the customer for which the order was created. 
SELECT os.order_number, os.order_date, cs.customer_id, cs.first_name, cs.last_name
FROM orders os
JOIN customers cs ON (os.cust_id = cs.customer_id);

/* Query 2 */
-- Question : For each order placed on 04/24/2020, write a SQL statement that lists the  order number, customer ID, first name, and last name of the customer for which the order was created. 
SELECT os.order_number, cs.customer_id, cs.first_name, cs.last_name
FROM orders os
JOIN customers cs ON (os.cust_id = cs.customer_id)
WHERE order_date = '2020-04-24';

/* Query 3 */
-- Question : For  each  order,  write  a  SQL  statement  that  lists  the  item  number,  order  date,  order  ID,  quantity ordered, and price for each food item that makes up an order. 
SELECT order_number, order_date, item_number, quantity, price
FROM orders
JOIN order_lines USING(order_number)
JOIN food_items USING(item_number)
ORDER BY order_number;

/* Query 4 */
-- Question : For each order, write a SQL statement that lists the food item number, order date, order number, and description for each food item that makes up an order. Order the rows by category and then by order number. 
SELECT order_number, order_date, item_number, description
FROM orders
JOIN order_lines USING(order_number)
JOIN food_items USING(item_number)
ORDER BY category_id, order_number;

/* Query 5 */
-- Question : Write a SQL statement that lists the order number and order date for each order that contains the food item description 'Chicken Sandwich'. 
SELECT order_number, order_date
FROM orders
JOIN order_lines USING(order_number)
JOIN food_items USING(item_number)
WHERE description = 'Chicken Sandwich';

/* Query 6 */
-- Question : Write a SQL statement that lists the order number and order date for each order that was created for Philip Dennis but does not contain the food item description 'Shack Burger'.  
SELECT order_number, order_date
FROM orders
JOIN order_lines USING(order_number)
JOIN food_items USING(item_number)
WHERE cust_id = 30 AND description != 'Shack Burger';

/* Query 7 */
-- Question : Return the first name, last name, and department name for all employees including those employees not assigned to a department.  
SELECT s.first_name, s.last_name, d.department_name
FROM staff s
LEFT JOIN departments d ON (s.dept_id = d.department_id);

/* Query 8 */
-- Question : Return the first name, last name, and  department name for all employees including those departments that do not have an employee assigned to them. 
SELECT s.first_name, s.last_name, d.department_name
FROM departments d
LEFT JOIN staff s ON (d.department_id = s.dept_id);

/* Query 9 */
-- Question : Using the International Foods Restaurant database, show all shift descriptions and shift assignment dates (even if there is no date assigned for each shift description). 
SELECT description, shift_assign_date
FROM shifts
LEFT JOIN shift_assignments USING(code);

/*  Query 10 */
-- Question : You need to produce a report for International Foods Restaurant showing customers and orders. A customer must be included on the report even if the customer has had no orders. 
SELECT cs.customer_id, cs.last_name, os.order_date
FROM customers cs
LEFT JOIN orders os ON (cs.customer_id = os.cust_id);

/*  Query 11 */
-- Question : Create a query of the database that shows employee last names, department IDs, and department names. Include all employees even if they are not assigned to a department. 
SELECT s.last_name, s.dept_id, d.department_name
FROM staff s
LEFT JOIN departments d ON (s.dept_id = d.department_id);