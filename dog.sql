

#example

create table dog(
reg_id int,
dog_name varchar(20),
dog_class int,
age int);

insert into dog(reg_id, dog_name, dog_class, age)values
(444, 'animal', 1, 23),
(111, 'bird', 1, 23),
(222, 'snake', 3, 22),
(333, 'food', 4, 24);

select * from dog;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE dog
ADD dog_color VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE dog
SET dog_color = 'white'
WHERE reg_id = 111;

UPDATE dog
SET dog_color = 'brown'
WHERE reg_id = 444;

UPDATE dog
SET dog_color = 'sandal'
WHERE reg_id = 222;

UPDATE dog
SET dog_color = 'black'
WHERE reg_id = 333;