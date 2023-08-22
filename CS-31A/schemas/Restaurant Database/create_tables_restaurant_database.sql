

/* ****************************************************************************/
/*                                                                            */
/*                                                                            */
/*                  The Restaurant  Database                                  */
/*                                                                            */
/*                                                                            */
/* ****************************************************************************/



DROP DATABASE IF EXISTS restaurant;
CREATE DATABASE restaurant;
USE restaurant;

-- Drop all tables if they exist
DROP TABLE IF EXISTS shift_assignments;
DROP TABLE IF EXISTS shifts;
DROP TABLE IF EXISTS order_lines;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS food_items;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS regular_menus;
DROP TABLE IF EXISTS promotional_menus;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    department_id DECIMAL(4 , 0 ),
    department_name VARCHAR(30) NOT NULL,
    manager_id DECIMAL(6 , 0 ),
    CONSTRAINT dept_id_pk PRIMARY KEY (department_id)
);

-- Create jobs table
CREATE TABLE jobs (
    job_id VARCHAR(10),
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(6 , 0 ),
    max_salary DECIMAL(6 , 0 ),
    CONSTRAINT job_id_pk PRIMARY KEY (job_id)
);
-- Create customers table
CREATE TABLE customers (
    customer_id DECIMAL(5 , 0 ),
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip DECIMAL(10 , 0 ) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    CONSTRAINT csr_id_pk PRIMARY KEY (customer_id)
);

-- Create promotional_menus table
CREATE TABLE promotional_menus (
    code VARCHAR(3),
    name VARCHAR(30) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    give_away VARCHAR(80),
    CONSTRAINT pmu_code_pk PRIMARY KEY (code)
);

-- Create regular_menus table
CREATE TABLE regular_menus (
    code VARCHAR(3),
    type VARCHAR(30) NOT NULL,
    hours_served VARCHAR(30) NOT NULL,
    CONSTRAINT rmu_code_PK PRIMARY KEY (code)
);

CREATE TABLE categories (
    category_id VARCHAR(5),
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT category_id_pk PRIMARY KEY (category_id)
);

-- Create food_items table
CREATE TABLE food_items (
    item_number DECIMAL(5 , 0 ),
	category_id VARCHAR(5),
    description VARCHAR(100) NOT NULL,
    price DECIMAL(8 , 2 ) NOT NULL,
    regular_code VARCHAR(3),
    promo_code VARCHAR(3),
    CONSTRAINT fim_item_number_pk PRIMARY KEY (item_number),
     CONSTRAINT category_fk FOREIGN KEY (category_id)
        REFERENCES categories( category_id),
    CONSTRAINT fim_promo_code_fk FOREIGN KEY (promo_code)
        REFERENCES promotional_menus (CODE),
    CONSTRAINT fim_regular_code_fk FOREIGN KEY (regular_code)
        REFERENCES regular_menus (CODE)
);

-- Create staff table
CREATE TABLE staff (
    staff_id DECIMAL(5 , 0 ),
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    email VARCHAR(35) NOT NULL,
    birthdate DATE NOT NULL,
    salary DECIMAL(8 , 2 ) NOT NULL,
    overtime_rate DECIMAL(5 , 2 ),
    training VARCHAR(50),
    job_id VARCHAR(10) NOT NULL,
    manager_id DECIMAL(5 , 0 ),
    dept_id DECIMAL(4 , 0 ),
    hire_date DATE NOT NULL,
    CONSTRAINT emp_salary_min CHECK (salary > 0),
    CONSTRAINT emp_email_uk UNIQUE (email),
    CONSTRAINT stf_id_pk PRIMARY KEY (staff_id),
    CONSTRAINT staff_dept FOREIGN KEY (dept_id)
        REFERENCES departments (department_id),
    CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id)
        REFERENCES staff (staff_id),
         CONSTRAINT staff_job FOREIGN KEY (job_id)
        REFERENCES jobs (job_id)
);

-- Create orders table
CREATE TABLE orders (
    order_number DECIMAL(5 , 0 ),
    order_date DATE NOT NULL,
    cust_id DECIMAL(5 , 0 ) NOT NULL,
    staff_id DECIMAL(5 , 0 ) NOT NULL,
    CONSTRAINT odr_order_number_pk PRIMARY KEY (order_number),
    CONSTRAINT odr_cust_id_fk FOREIGN KEY (cust_id)
        REFERENCES customers (customer_id),
    CONSTRAINT odr_staff_id_fk FOREIGN KEY (staff_id)
        REFERENCES staff (staff_id)
);

-- Create order_lines table
CREATE TABLE order_lines (
    order_number DECIMAL(5 , 0 ),
    item_number DECIMAL(5 , 0 ),
    quantity DECIMAL(3 , 0 ) NOT NULL,
    CONSTRAINT ole_pk PRIMARY KEY (order_number , item_number),
    CONSTRAINT ole_item_number_fk FOREIGN KEY (item_number)
        REFERENCES food_items (item_number),
    CONSTRAINT ole_order_number_fk FOREIGN KEY (order_number)
        REFERENCES orders (order_number)
);

-- Create shifts table
CREATE TABLE shifts (
    Code DECIMAL(5 , 0 ),
    description VARCHAR(100) NOT NULL,
    CONSTRAINT sft_code_pk PRIMARY KEY (code)
);

-- Create shift_assignments table
CREATE TABLE shift_assignments (
    code DECIMAL(5 , 0 ),
    id DECIMAL(5 , 0 ),
    shift_assign_date DATE NOT NULL,
    CONSTRAINT sat_pk PRIMARY KEY (Code , id),
    CONSTRAINT sat_code_fk FOREIGN KEY (code)
        REFERENCES shifts (Code),
    CONSTRAINT sat_id_fk FOREIGN KEY (id)
        REFERENCES staff (staff_id)
);



