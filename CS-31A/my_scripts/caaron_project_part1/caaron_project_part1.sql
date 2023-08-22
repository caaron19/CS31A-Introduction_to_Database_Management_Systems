/* Project_Part1.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/
/*
TASK 1:
Write the DDL statements for creating the tables for the University database. Include NOT NULL constraints where necessary.
Choose appropriate data types for each attribute.
*/
/*
TASK 2:    
Identify foreign keys for the database tables. Also specify tables referenced by the foreign key.
Note: Some tables have composite primary key. Identify all composite key attributes for such tables.
*/

DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;

-- drop all tables if they exist
DROP TABLE IF EXISTS academic_session;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS parent_info;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS exam_type;
DROP TABLE IF EXISTS exam;
DROP TABLE IF EXISTS exam_result;
DROP TABLE IF EXISTS student_att;
DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS faculty_course;
DROP TABLE IF EXISTS faculty_login;

-- Create academic_session table
CREATE TABLE academic_session(
	session_id INT,
    session_name VARCHAR(30) UNIQUE KEY,
    CONSTRAINT session_pk PRIMARY KEY (session_id)
);

-- Create department table
CREATE TABLE department(
	dept_id INT,
    dept_name VARCHAR(30) UNIQUE KEY,
    head VARCHAR(50),
    CONSTRAINT department_pk PRIMARY KEY (dept_id)
);

-- Create parent_info table
CREATE TABLE parent_info(
	parent_id INT, 
    parent1_fn VARCHAR(25), 
    parent1_ln VARCHAR(35), 
    parent2_fn VARCHAR(25), 
    parent2_ln VARCHAR(35),
    CONSTRAINT parent_pk PRIMARY KEY (parent_id)
);

-- Create student table
CREATE TABLE student(
	student_id INT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    reg_year DATE NOT NULL,
    email VARCHAR(50) UNIQUE KEY,
    parent_id INT,
    CONSTRAINT student_pk PRIMARY KEY (student_id),
    CONSTRAINT student_parent_fk FOREIGN KEY(parent_id) 
		REFERENCES parent_info(parent_id)
);

-- Create course table
CREATE TABLE course(
	course_id INT,
    course_name VARCHAR(100) UNIQUE KEY,
    session_id INT, 
    dept_id INT, 
    logon_id VARCHAR(20), 
    password VARCHAR(25), 
    building VARCHAR(25), 
    room VARCHAR(10), 
    date_time VARCHAR(15),
    CONSTRAINT course_pk PRIMARY KEY (course_id),
    CONSTRAINT course_session_fk FOREIGN KEY(session_id) 
		REFERENCES academic_session(session_id),
    CONSTRAINT course_department_fk FOREIGN KEY(dept_id) 
		REFERENCES department(dept_id)
);

-- Create faculty table
CREATE TABLE faculty(
	faculty_id INT, 
    first_name VARCHAR(25) NOT NULL, 
    last_name VARCHAR(35) NOT NULL, 
    faculty_email VARCHAR(50) UNIQUE KEY, 
    salary INT, 
    insurance VARCHAR(50), 
    hourly_rate INT, 
    dept_id INT ,
    CONSTRAINT faculty_pk PRIMARY KEY (faculty_id),
    CONSTRAINT faculty_department_fk FOREIGN KEY(dept_id) 
		REFERENCES department(dept_id)
);

-- Create exam_type table
CREATE TABLE exam_type(
	exam_type CHAR(4),
    name VARCHAR(35) NOT NULL,
    description VARCHAR(100) NOT NULL,
    CONSTRAINT exam_type_pk PRIMARY KEY (exam_type)
);

-- Create exam table
CREATE TABLE exam(
	exam_id INT,
    start_date DATE NOT NULL,
    exam_type CHAR(4),
    course_id INT,
    CONSTRAINT exam_pk PRIMARY KEY (exam_id),
    CONSTRAINT exam_exam_type_fk FOREIGN KEY(exam_type) 
		REFERENCES exam_type(exam_type),
    CONSTRAINT exam_course_fk FOREIGN KEY(course_id) 
		REFERENCES course(course_id)
);

-- Create exam_result table
CREATE TABLE exam_result(
	student_id INT,
    course_id INT,
    exam_id INT,
    exam_grade INT NOT NULL,
    CONSTRAINT exam_result_pk PRIMARY KEY (student_id, course_id, exam_id)
);

-- Create student_att table
CREATE TABLE student_att(
	student_id INT,
    session_id INT,
    num_work_days INT NOT NULL,
    num_days_off INT,
    exam_eligibility CHAR(1) NOT NULL,
    CONSTRAINT student_att_pk PRIMARY KEY (student_id, session_id)
);

-- Create student_course table
CREATE TABLE student_course(
	student_id INT,
    course_id INT,
    grade CHAR(1) NOT NULL,
    CONSTRAINT student_course_pk PRIMARY KEY (student_id, course_id)
);

-- Create faculty_course table
CREATE TABLE faculty_course(
	faculty_id INT,
    course_id INT,
    contact_hrs INT NOT NULL,
    CONSTRAINT faculty_course_pk PRIMARY KEY (faculty_id, course_id)
);

-- Create faculty_login table
CREATE TABLE faculty_login(
	faculty_id INT,
    login_date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT faculty_login_pk PRIMARY KEY (faculty_id, login_date_time)
);

-- Show table descriptions in University Database
DESCRIBE academic_session;
DESCRIBE department;
DESCRIBE parent_info;
DESCRIBE student;
DESCRIBE course;
DESCRIBE faculty;
DESCRIBE exam_type;
DESCRIBE exam;
DESCRIBE exam_result;
DESCRIBE student_att;
DESCRIBE student_course;
DESCRIBE faculty_course;
DESCRIBE faculty_login;