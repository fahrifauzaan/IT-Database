--NO 1. Tampilkan dari table customer dengan kondisi customer_id di range 1 sampai 10 ataupun 90 sampai 100--
select * from customer where customer_id BETWEEN 1 AND 10
OR customer_id BETWEEN 90 AND 100;
select * from customer where customer_id BETWEEN 1 AND 10 
union all
select * from customer where customer_id BETWEEN 90 AND 100
order by customer_id;

--NO 2. Tampilkan store_id, active, jumlah customer_id dari table customer--
select store_id, active, count(customer_id) as jumlah_customerid from customer
group by store_id, active;

--NO 3. Tampilkan store_id, jumlah customer_id dari table customer dengan kondisi active = true--
select store_id, active, count(customer_id) as jumlah_customerid, 
case when active = 1 then 'true' when active = 0 then 'false' end as kondisi from customer
group by store_id, active;

--NO 4a. Tampilkan store_id, rental_date dari table inventory dan rental--
select store_id, rental_date FROM inventory i
INNER JOIN rental r ON i.inventory_id = r.inventory_id;

--NO 4b. Tampilkan store_id, hitung(rental_date) dari table inventory dan rental--
select store_id, COUNT(rental_date) from inventory i
INNER JOIN rental r ON i.inventory_id = r.inventory_id 
group by store_id;

--NO 5a. Tampilkan payment_id, return_date dari table payment dan rental (beserta data yang null)--
select p.payment_id, r.return_date from payment p full
OUTER JOIN rental r ON p.rental_id = r.rental_id;

--NO 5b. Tampilkan payment_id, return_date, email dari table payment, rental dan staff--
select p.payment_id, r.return_date, s.email 
from payment p
JOIN rental r ON p.staff_id = r.staff_id
JOIN staff s ON s.staff_id = r.staff_id;