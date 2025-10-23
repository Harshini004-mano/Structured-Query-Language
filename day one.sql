use harshinidb;

#create table
CREATE TABLE students (
 course_id INT,
 first_name VARCHAR(20),
 address VARCHAR(20),
 age INT,
 percentage INT,
 grade VARCHAR(10)
);

INSERT INTO students (course_id, first_name, address, age, percentage, grade)
VALUES
(102, 'mahi', 'Bangalore', 21, 90, 'A+'),
(103, 'hari', 'Hyderabad', 19, 78, 'B'),
(104, 'dori', 'Delhi', 22, 88, 'A');

ALTER TABLE students ADD student_duration INT;

SHOW TABLES;

DESC students;

INSERT INTO students (course_id, first_name, address, age, percentage, grade, student_duration)VALUES (105, 'Anita', 'Mumbai', 21, 92, 'A+', 4);

UPDATE students
SET student_duration = 3
WHERE course_id = 106;

ALTER TABLE students
ADD PRIMARY KEY (course_id);

UPDATE students
SET student_duration = 3
WHERE course_id = 106;

SELECT * FROM students;

UPDATE students
SET student_duration = 3
WHERE course_id = 102;

SELECT * FROM students;

UPDATE students
SET student_duration = 5
WHERE course_id = 104;

SELECT * FROM students;

UPDATE students
SET student_duration = 3
WHERE course_id = 103;

#inset command
INSERT INTO students (course_id, first_name, address, age, percentage, grade)VALUES
(101, 'shya', 'Bangalore', 21, 90, 'A+'),
(106, 'mano', 'Hyderabad', 19, 78, 'B'),
(107, 'sadhi', 'dubai', 18, 99, 'A+');

#discription 
#it shows the discription that is title of the table
desc students;

#update command
UPDATE students
SET student_duration = 3
WHERE course_id = 107;

UPDATE students
SET student_duration = 4
WHERE course_id = 106;


UPDATE students
SET student_duration = 5
WHERE course_id = 101;

#delete command
DELETE FROM students
WHERE course_id = 103;

DELETE FROM students
WHERE course_id = 105;

#search commands
SELECT * FROM students;

SELECT * FROM students WHERE address = 'dubai' or percentage >=80;

 #SELECT with LIKE (Pattern Matching) 
SELECT * FROM  students WHERE first_name LIKE 'm%';
       #it used to selct the starting letter of the name
SELECT * FROM  students WHERE first_name LIKE '_a%';
       #it used to select the second letter of the name
       #___ used to select third letter of the name
       
#between and select:
#it shows the values in between them
SELECT * FROM studentS WHERE percentage BETWEEN 70 AND 90;

#select and distinct:
SELECT distinct address FROM students;
#shows unique cities in the table


#select with aggregate function:
#shows the average mark of the student
SELECT AVG(percentage)AS averagepercentage from students;

#to count the table:
