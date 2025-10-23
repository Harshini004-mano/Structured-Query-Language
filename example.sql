#EXAMPLE

CREATE TABLE town
(
town_id INT,
town_name VARCHAR(255),
town_code INT,
population int);

INSERT INTO town (town_id, town_name, town_code, population)VALUES
(102, 'madhurai', 632101, 210762),
(103, 'karur', 639120, 199034),
(104, 'puthukottai', 621212, 212047);

#shows all columns and all rows from the table. 
SELECT * FROM town;

iNSERT INTO town (town_id, town_name, town_code, population)VALUES
(101, 'manaparai', 632102, 210862),
(105, 'trichy', 639122, 1950134),
(106, 'perambalur', 621222, 2130767),
(109, 'kovai', 632104, 211862),
(108, 'tirupur', 639182, 1900144),
(107, 'chithambaram', 621292, 2120768),
(110, 'kodaikanal', 632109, 210662),
(111, 'selam', 639192, 1900334),
(112, 'thiruvarur', 621022, 2120787);

SELECT town_name, population FROM town WHERE town_id % 3 = 0;
#it used to find the multiples of 3 in the table
SELECT town_name, population FROM town WHERE town_id % 2 = 0;
#it used to find the multiples of 2 in the table

#SELECT with ORDER BY (Sorting) 
#shows students in descending order of marks. 
SELECT * FROM town ORDER BY town_name DESC; 

#SELECT with IN   
SELECT * FROM Students WHERE City IN ('Chennai', 'Salem'); 
#Shows students from Chennai or Salem. 

#SELECT with GROUP BY 
SELECT town_name, COUNT(*) AS Totaltown
FROM town
GROUP BY town_name; 
#Shows number of students in each City. 

#SELECT with HAVING (after GROUP BY) 
SELECT City, AVG(Marks) AS AvgMarks 
FROM Students 
GROUP BY City 
HAVING AVG(Marks) > 80; 
#Shows cities where the average marks > 80.