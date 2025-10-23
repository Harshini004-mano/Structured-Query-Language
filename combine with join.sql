use harshinidb;


DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, student_name, city) VALUES
(1, 'Alice', 'London'),
(2, 'Bob', 'New York'),
(3, 'Charlie', 'Paris');

INSERT INTO courses (course_id, student_id, course_name) VALUES
(101, 1, 'Math'),
(102, 1, 'Science'),
(103, 2, 'English');

#inner join
SELECT st.student_name, c.course_name
FROM students st
INNER JOIN courses c
ON st.student_id = c.student_id;

#left join
SELECT st.student_name, c.course_name
FROM students st
LEFT JOIN courses c
ON st.student_id = c.student_id;


#right join
SELECT st.student_name, c.course_name
FROM students st
RIGHT JOIN courses c
ON st.student_id = c.student_id;

SELECT st.student_name, c.course_name
FROM students st
LEFT JOIN courses c
ON st.student_id = c.student_id

UNION

SELECT st.student_name, c.course_name
FROM students st
RIGHT JOIN courses c
ON st.student_id = c.student_id;