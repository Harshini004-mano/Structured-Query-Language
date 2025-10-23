#example
CREATE TABLE school(
roll_id INT,
name varchar(20),
class VARCHAR(10),
no_sub INT);


iNSERT INTO school (roll_id, name, class, no_sub)VALUES
(1, 'bilu', 'a', 5),
(2, 'simba', 'a', 5),
(3, 'karupa', 'b', 4),
(4, 'jeshu', 'a', 5),
(5, 'mani', 'b', 4),
(7, 'bachi', 'a', 5),
(6, 'chechin', 'b', 4);

SELECT * FROM school;