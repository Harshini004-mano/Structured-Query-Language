CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    emp_age INT,
    emp_dept VARCHAR(50)
);

CREATE TABLE emp_salary (
    emp_sal_id INT PRIMARY KEY,
    emp_id INT,
    emp_salary INT,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

INSERT INTO employee (emp_id, emp_name, emp_age, emp_dept) VALUES
(1, 'mano', 30, 'HR'),
(2, 'shya', 28, 'Finance'),
(3, 'sadhi', 35, 'IT'),
(4, 'mahi', 40, 'Marketing'),
(5, 'hari', 25, 'IT'),
(6, 'dori', 32, 'Finance'),
(7, 'sugir', 29, 'Operations'),
(8, 'srihan', 38, 'HR'),
(9, 'mukuth', 27, 'IT'),
(10, 'vihan', 45, 'Management');

INSERT INTO emp_salary (emp_sal_id, emp_id, emp_salary) VALUES
(101, 1, 60000),
(102, 2, 55000),
(103, 3, 75000),
(104, 4, 68000),
(105, 5, 52000),
(106, 6, 58000),
(107, 7, 61000),
(108, 8, 72000),
(109, 9, 50000),
(110, 10, 90000);

SELECT 
    emp_id,
    emp_name,
    emp_age,
    emp_dept,
    (SELECT emp_salary 
     FROM emp_salary 
     WHERE emp_salary.emp_id = employee.emp_id
     LIMIT 1) AS emp_salary
FROM employee ;
#LIMIT 1 ensures that even if there are multiple salary records for the same employee, it only picks one.
#or

SELECT 
    emp_id,
    emp_name,
    emp_age,
    emp_dept,
    (SELECT emp_salary 
     FROM emp_salary 
     WHERE emp_salary.emp_id = employee.emp_id) AS emp_salary
FROM employee;