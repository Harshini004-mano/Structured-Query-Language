
use harshinidb;

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    grade INT NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO students (id, name, grade, email) VALUES
(1, 'Alice Johnson', 10, 'alice.j@school.edu'),
(2, 'Bob Smith', 11, 'bob.s@school.edu'),
(3, 'Charlie Brown', 10, 'charlie.b@school.edu'),
(4, 'Diana Ross', 12, 'diana.r@school.edu'),
(5, 'Ethan Hunt', 11, 'ethan.h@school.edu');

SELECT * FROM students;

CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    instructor VARCHAR(100),
    credits INT
);

INSERT INTO courses (id, name, instructor, credits) VALUES
(101, 'Algebra',    'Mr. Thompson', 3),
(102, 'Biology',    'Mrs. Garcia',  4),
(103, 'History',    'Ms. Lee',      3),
(104, 'Physics',    'Dr. Brown',    3),
(105, 'Literature', 'Mrs. Davis',   3);

SELECT * FROM courses;

CREATE TABLE enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade CHAR(1),
    PRIMARY KEY (student_id, course_id, enrollment_date),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 101, '2023-09-01', 'A'),
(1, 102, '2023-09-01', 'B'),
(2, 103, '2023-09-02', 'A'),
(2, 104, '2023-09-02', 'C'),
(3, 101, '2023-09-01', 'B'),
(3, 105, '2023-09-03', 'A'),
(4, 102, '2023-09-02', 'A'),
(4, 104, '2023-09-02', 'B'),
(5, 103, '2023-09-03', 'B'),
(5, 105, '2023-09-03', 'A');

SELECT * FROM enrollments;

USE harshinidb;
    #----question 1----
SELECT 
    name AS student_name, 
    email
FROM students
WHERE grade = 11
ORDER BY name ASC;
     #-----question 2----
SELECT 
    s.name AS student_name,
    c.name AS course_name
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
WHERE e.grade = 'A'
ORDER BY s.name ASC, c.name ASC;
     #------question 3-------
     UPDATE courses
SET credits = 5
WHERE name = 'Physics';

-- Verify the update:
SELECT * FROM courses;
     #------question 4------
SELECT 
    c.name AS course_name,
    COUNT(e.student_id) AS total_enrolled
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.name
ORDER BY total_enrolled DESC, c.name ASC;
       #-----question 5----
-- Add new student
INSERT INTO students (id, name, grade, email)
VALUES (6, 'Frank White', 10, 'frank.w@school.edu');

-- Enroll him in Algebra (101) and Literature (105)
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(6, 101, '2024-12-20'),
(6, 105, '2024-12-20');

-- Display his enrollments
SELECT 
    s.name AS student_name,
    c.name AS course_name,
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
WHERE s.id = 6
ORDER BY e.enrollment_date, c.name;




