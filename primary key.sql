#crete a foreign key for the primary key                              
#parent table
CREATE TABLE departmentA( 
dep_ID INT PRIMARY KEY,
dep_name VARCHAR(50));

#CHILD TABLE
CREATE TABLE childA(
child_ID INT PRIMARY KEY,
child_name VARCHAR(10),
dep_ID INT,
FOREIGN KEY(dep_ID) REFERENCES departmentA(dep_ID));