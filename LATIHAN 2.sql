--1. Tampilkan data film dengan kriteria film_id kelipatan 5
select film_id,title from film where len(title) > 15 and len(film_id) > 3;

--2. Tampilkan data rental_id yang kosong dari tabel payment

--3. Tampilkan actor_id, hitung jumlah actor_id dari tabel film_actor


-- 2022-09-14

-- select
select * from customer;

-- select column and order by
select customer_id, store_id from customer order by customer_id;


-- grouping
select store_id, count(*) from customer
group by store_id
order by store_id desc;

-- grouping and having
select store_id, count(*) from customer
group by store_id
having count(*) <> 200
order by store_id;


--skip 10 data
select * from customer order by customer_id offset 10 rows;

--skip 10 data
--ambil 10 data pertama
select * from customer order by customer_id offset 10 rows
fetch first 10 rows only;

-- distinct
select distinct store_id,customer_id from customer;

-- group by
select store_id, customer_id from customer group by store_id, customer_id;

-- where
select * from customer where store_id = 1
and customer_id = 1
order by customer_id;

-- like
select * from customer where store_id = 1
or first_name like 'AR%';


-- in
select * from customer where customer_id 
in (1, 2, 3);

-- null
select * from payment where rental_id is null;

-- not null
select * from payment where rental_id is not null;


-- alias table
select p.payment_id from payment as p where rental_id is not null;

-- alias column
select p.payment_id as p_id from payment as p where rental_id is not null;



-- 2022-09-15
-- inner join alias
select
	fa.actor_id actor_id,
	-- film_actor.film_id,
	f.title title
from film f
inner join film_actor fa on f.film_id = fa.film_id


-- inner join (3 tables)
select
	f.title as film_title,
	c.name as category_name
from film as f
inner join film_category as fc on f.film_id = fc.film_id
inner join category as c on fc.category_id = c.category_id
order by f.title desc;

-- inner join (count 3 tables using aggregation)
select
	c.name as category_name,
	count(f.title) as title_counter
from film as f
inner join film_category as fc on f.film_id = fc.film_id
inner join category as c on fc.category_id = c.category_id
group by c.name;

-- left join
select 
	payment.customer_id,
	payment.staff_id,
	rental_date
from payment
left join rental on payment.rental_id = rental.rental_id;

-- right join
select 
	payment.customer_id,
	rental_date,
	return_date
from payment
right join rental on payment.rental_id = rental.rental_id;


-- full join
select 
	payment.customer_id,
	rental_date,
	return_date
from payment
full join rental on payment.rental_id = rental.rental_id;


-- concat string (combine two column) 
select first_name + ' ' + last_name from staff;

-- aggregation max, min, count, sum, average
select
	customer_id,
	max(amount) max_amount,
	min(amount) min_amount,
	count(amount) count_amount,
	sum(amount) sum_amount,
	avg(amount) avg_amount
from payment group by customer_id
having avg(amount) > 3;