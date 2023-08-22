/* Project_Part2.sql 
   CONNOR AARON
   CS 31A, Fall 2021
*/
/*
TASK 3:
Insert rows into the tables created for the University Database
*/
USE university;

-- populate academic_session table
INSERT INTO academic_session VALUES(100, 'Spring session');
INSERT INTO academic_session VALUES(200, 'Fall session');
INSERT INTO academic_session VALUES(300, 'Summer session');

-- populate department table
INSERT INTO department VALUES(10, 'Accounting', 'Mark Smith');
INSERT INTO department VALUES(20, 'Biology', 'Dave Gold');
INSERT INTO department VALUES(30, 'Computer Science', 'Linda Brown');
INSERT INTO department VALUES(40, 'Literature', 'Anita Taylor');

-- populate parent_info table
INSERT INTO parent_info VALUES(600, 'Neil', 'Smith', 'Doris' ,'Smith');
INSERT INTO parent_info VALUES(610, 'William', 'Ben', 'Nita', 'Ben');
INSERT INTO parent_info VALUES(620, 'Sean', 'Taylor', 'Rhea' ,'Taylor');
INSERT INTO parent_info VALUES(630, 'Dave', 'Carmen', 'Cathy', 'Carmen');
INSERT INTO parent_info VALUES(640, 'John', 'Audry', 'Jane', 'Audry');

-- populate student table
INSERT INTO student VALUES(720, 'Jack', 'Smith', '2012-01-12', 'jsmith@school.edu', 600);
INSERT INTO student VALUES(730, 'Noah', 'Audry', '2012-01-01', 'naudry@school.edu', 640);
INSERT INTO student VALUES(740, 'Rhonda', 'Taylor', '2012-09-01', 'rtaylor@school.edu', 620);
INSERT INTO student VALUES(750, 'Robert', 'Ben', '2012-03-01', 'rben@school.edu', 610);
INSERT INTO student VALUES(760, 'Jeanne', 'Ben', '2012-03-01', 'jben@school.edu', 610);
INSERT INTO student VALUES(770, 'Mills', 'Carmen', '2013-04-01', 'mcarmen@school.edu', 630); 

-- populate course table
INSERT INTO course VALUES(190, 'Principles of Accounting', 100, 10, NULL, NULL, 'building a', '101', 'mwf 12-1');
INSERT INTO course VALUES(191, 'Introduction to Lusiness Law', 100, 10, NULL, NULL, 'building b', '201', 'thur 2-4');
INSERT INTO course VALUES(192, 'Cost Accounting', 100, 10, NULL, NULL, 'building c', '301', 'tues 5-7');
INSERT INTO course VALUES(193, 'Strategic Tax Planning for Business', 100, 10, 'tax123', 'password', NULL, NULL, NULL);
INSERT INTO course VALUES(194, 'General Biology', 200, 20, 'bio123', 'password', NULL, NULL, NULL);
INSERT INTO course VALUES(195, 'Cell Biology', 200, 20, NULL, NULL, 'building d', '401', 'mwf 9-10');

-- populate faculty table
INSERT INTO faculty VALUES(800, 'Jill', 'Miller', 'jmill@school.edu', 10000, 'health', NULL, 20);
INSERT INTO faculty VALUES(810, 'James', 'Borg', 'jborg@school.edu', 30000, 'health,dental', NULL, 10);
INSERT INTO faculty VALUES(820, 'Lynn', 'Brown', 'lbrown@school.edu', NULL, NULL, 50, 30);
INSERT INTO faculty VALUES(830, 'Arthur', 'Smith', 'asmith@school.edu', NULL, NULL, 40, 10);
INSERT INTO faculty VALUES(840, 'Sally', 'Jones', 'sjones@school.edu', 50000, 'healt,dental,vision', NULL, 40);

-- populate exam_type table
INSERT INTO exam_type VALUES('MCE', 'Multiple Choice Exams', 'Choose more than one answer');
INSERT INTO exam_type VALUES('TF', 'True And False Exams', 'Choose either true or false');
INSERT INTO exam_type VALUES('FIB', 'Fill In The Blanks Exams', 'Type in the correct answer');
INSERT INTO exam_type VALUES('ESS', 'Essay Exams', 'Write paragraphs');
INSERT INTO exam_type VALUES('SA', 'Short Answer Exams', 'Write short answers');

-- populate exam table
INSERT INTO exam VALUES(500, '2013-09-12', 'MCE', 190);
INSERT INTO exam VALUES(510, '2013-09-15', 'SA', 191);
INSERT INTO exam VALUES(520, '2013-09-18', 'FIB', 192);
INSERT INTO exam VALUES(530, '2013-09-21', 'ESS', 193);
INSERT INTO exam VALUES(540, '2014-04-02', 'TF', 194);

-- populate exam_result table
INSERT INTO exam_result VALUES(720, 190, 500, 91);
INSERT INTO exam_result VALUES(720, 193, 520, 97);
INSERT INTO exam_result VALUES(730, 195, 540, 87);
INSERT INTO exam_result VALUES(730, 194, 530, 85);
INSERT INTO exam_result VALUES(750, 192, 500, 60);
INSERT INTO exam_result VALUES(750, 195, 510, 97);
INSERT INTO exam_result VALUES(750, 191, 520, 78);
INSERT INTO exam_result VALUES(760, 192, 540, 65);
INSERT INTO exam_result VALUES(760, 191, 530, 60);
INSERT INTO exam_result VALUES(760, 192, 510, 70);

-- populate student_att table
INSERT INTO student_att VALUES(720, 100, 180, 21, 'y');
INSERT INTO student_att VALUES(730, 200, 180, 11, 'y');
INSERT INTO student_att VALUES(740, 300, 180, 12, 'y');
INSERT INTO student_att VALUES(750, 100, 180, 14, 'y');
INSERT INTO student_att VALUES(760, 200, 180, 15, 'y');
INSERT INTO student_att VALUES(770, 300, 180, 13, 'y');

-- populate student_course table
INSERT INTO student_course VALUES(720, 190, 'A');
INSERT INTO student_course VALUES(720, 193, 'B');
INSERT INTO student_course VALUES(730, 191, 'C');
INSERT INTO student_course VALUES(740, 195, 'F');
INSERT INTO student_course VALUES(750, 192, 'A');
INSERT INTO student_course VALUES(760, 190, 'B');
INSERT INTO student_course VALUES(760, 192, 'C');
INSERT INTO student_course VALUES(770, 192, 'D');
INSERT INTO student_course VALUES(770, 193, 'F');
INSERT INTO student_course VALUES(770, 194, 'A');

-- populate faculty_course table
INSERT INTO faculty_course VALUES(800, 192, 3);
INSERT INTO faculty_course VALUES(800, 193, 4);
INSERT INTO faculty_course VALUES(800, 190, 5);
INSERT INTO faculty_course VALUES(800, 191, 3);
INSERT INTO faculty_course VALUES(810, 194, 4);
INSERT INTO faculty_course VALUES(810, 195, 5);

-- populate faculty_login table
INSERT INTO faculty_login VALUES(800, DEFAULT);
INSERT INTO faculty_login VALUES(810, DEFAULT);
INSERT INTO faculty_login VALUES(840, DEFAULT);
INSERT INTO faculty_login VALUES(820, DEFAULT);
INSERT INTO faculty_login VALUES(830, DEFAULT);

/*
TASK 4: QUERIES
*/

/*Query 1*/
/* Display the data inserted in the tables created for the University database. */
SELECT * FROM academic_session;
SELECT * FROM department;
SELECT * FROM parent_info;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM faculty;
SELECT * FROM exam_type;
SELECT * FROM exam;
SELECT * FROM exam_result;
SELECT * FROM student_att;
SELECT * FROM student_course;
SELECT * FROM faculty_course;
SELECT * FROM faculty_login;

/*Query 2*/
/*Display the different courses offered by the departments in the school. */
SELECT course_id, course_name, dept_name
FROM course JOIN department USING(dept_id);

/*Query 3*/
/*Display the courses offered in the Fall session. */
SELECT course_name, session_name
FROM course JOIN academic_session USING(session_id)
WHERE session_name = "fall session";

/*Query 4*/
/*Display  the  course  details,  the  department  that  offers  the  courses and students  who  have  enrolled  for 
those courses.  */
SELECT course_name, student_id, dept_name
FROM course JOIN student_course USING(course_id)
JOIN department USING(dept_id)
ORDER BY dept_name;

/*Query 5*/
/*Display  the  names  of  the  courses,  the  department  that  offers  those  courses,  and  students  who  have 
enrolled for those courses for department 20. */
SELECT course_name, student_id, dept_name
FROM course JOIN student_course USING(course_id)
JOIN department USING(dept_id)
WHERE dept_id = 20;

/*Query 6*/
/*Display the details of the exam grades obtained by students who have opted for the course with ID in the 
range of 190 to 192.*/
SELECT course_id, course_name, exam_grade, exam_id
FROM course JOIN exam_result USING(course_id)
WHERE course_id BETWEEN 190 AND 192;

/*Query 7*/
/*Retrieve  the  rows  from  the  EXAM_RESULT  table,  even  if  there  are  no  matching  records  in  the  COURSE 
table.  */
SELECT student_id, exam_grade, course_id, course_name
FROM exam_result LEFT JOIN course USING(course_id);

/*Query 8*/
/*Retrieve the exam grade obtained by each student for every exam attempted.  */
SELECT student_id, first_name, last_name, exam_id, exam_grade
FROM student JOIN exam_result USING(student_id);

/*Query 9*/
/*Write a query to check if a student is eligible to take exams based on the number of class days attended.  */
SELECT student_id, num_work_days, exam_eligibility
FROM student_att;

/*Query 10*/
/*The faculty of the different Departments realized that the exam grades entered in the EXAM_RESULT were 
showing  an  increased  value  of  5  points  for  each  entry.  Can  you  display  the  exam  grades  with  5  points 
subtracted from the marks obtained by each student?  */
SELECT first_name, last_name, student_id, course_id, exam_id, exam_grade - 5 AS "Adjusted Grade"
FROM exam_result JOIN student USING(student_id);