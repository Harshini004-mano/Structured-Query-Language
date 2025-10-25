use harshinidb;

create table if not exists dress (
id int auto_increment primary key,
name varchar (100) not null,
age int);

create table if not exists dress(
		id int auto_increment primary key,
        name varchar(100) not null,
        age int
        );
insert into dress(name,age) values('Deepika',21);
insert into dress(name,age) values('Taylor',21);
insert into dress(name,age) values('Priyanka',21);
select*from dress;
use harshinidb;
select * from dress;
