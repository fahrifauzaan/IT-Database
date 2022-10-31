--1. Buat 2 table baru dengan nama sales, sale_items.
--	Dengan kriteria : 
	--a. Sales
		--id integer primary key
		--supplier_id integer not null
		--total decimal not null default 0
	--b. Sales_items
		--id integer
		--sale_id integer not null
		--item_name varchar(100) not null
		--amount decimal(10, 2) not null
		--tax decimal (4,2 ) not null
		--primary key (id, sale_id)
		--foreign key (sale_id) pada table sales (id)
create table Sales (
    id int primary key,
    supplier_id int NOT NULL,
    total decimal NOT NULL
	);

create table Sales_items (
	id int,
	sale_id int references Sales(id),
	item_name varchar(100) NOT NULL,
    amount decimal(10,2) NOT NULL,
    tax decimal(4,2) NOT NULL,
    primary key (id, sale_id),);

--2. Insert table sales sebanyak 2 baris data value bebas.
insert into Sales (id, supplier_id, total)

values

(2, 9, 13),
(1, 8, 40);

--3. Insert ke table sale_items sebanyak 4 baris data value bebas
INSERT INTO Sales_items (id, sale_id, item_name, amount, tax)

VALUES

(1, 1, 'Stang', 1000, 5),
(2, 2, 'Sadel', 3400, 5.5),
(3, 1, 'Ban', 6800, 10),
(4, 2, 'Rem', 4000, 15);

--4. Update data table sales dengan mengubah kolom tax = 30.
update Sales_items
set tax = 30;