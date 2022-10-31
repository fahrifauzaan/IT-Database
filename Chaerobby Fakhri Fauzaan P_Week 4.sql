--1. DDL (Data Definition Language) - Create table with this requirements.
--positions
	CREATE TABLE positions (
	position_id INT PRIMARY KEY,
    position_name varchar(255)  NOT NULL,
);

--persons
	CREATE TABLE persons (
	person_id int primary key,
	position_id int not null,
	last_name varchar(255) not null,
	first_name varchar(255) not null,
	age int,
	FOREIGN KEY (position_id) REFERENCES positions (position_id)
);


--person_transactions
	CREATE TABLE person_transactions (
	id int primary key,
	person_id int not null,
	discount decimal(5,2) default 0,
	start_date date not null,
	expired_date date not null,
	FOREIGN KEY (person_id) REFERENCES persons (person_id)
);


--2. DML (Data Manipulation Language) - Insert, Update, Select

INSERT INTO positions(position_id,position_name ) VALUES(1,'Marketing')
INSERT INTO positions(position_id,position_name ) VALUES(2,'Operations')
INSERT INTO positions(position_id,position_name ) VALUES(3,'Finance')

select * from positions;

INSERT INTO persons(person_id,position_id,last_name,first_name,age ) VALUES(121,2,'Lebron','James',29)
INSERT INTO persons(person_id,position_id,last_name,first_name,age ) VALUES(122,2,'Kyrie','Irvin',21)
INSERT INTO persons(person_id,position_id,last_name,first_name,age ) VALUES(111,1,'Kurnia','Mega',25)
INSERT INTO persons(person_id,position_id,last_name,first_name,age ) VALUES(112,1,'Joko','Widodo',27)
INSERT INTO persons(person_id,position_id,last_name,first_name,age ) VALUES(131,3,'Erick','Tohir',24)

select * from persons;

INSERT INTO person_transactions(id,person_id,discount,start_date,expired_date ) VALUES(1,121,0.2,'2022-10-06','2023-10-06')
INSERT INTO person_transactions(id,person_id,discount,start_date,expired_date ) VALUES(2,111,0.25,'2022-06-26','2023-06-26')
INSERT INTO person_transactions(id,person_id,discount,start_date,expired_date ) VALUES(3,131,0.18,'2022-02-11','2023-12-24')

select * from person_transactions;

UPDATE person_transactions set discount = 20 where id = 2
UPDATE person_transactions set discount = 10, start_date = '2021-02-27' where id = 1

select age.persons, first_name.persons, 
	last_name.persons, position_name.position, 
	discount.person_transaction, expired_date.person_transaction
from persons left join position on persons.id=position.id
left join person_transactions on position.id=person_transactions.id
group by id;


select * from persons;