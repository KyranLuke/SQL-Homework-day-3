--1. List all customers who live in Texas (use JOINs) 
select customer.first_name, customer.last_name, district 
from customer 
full join address  
ON customer.address_id = address.address_id
where district  = 'Texas';
--2. Get all payments above $6.99 with the Customer's Full Name 
select first_name,last_name,amount
from customer 
full JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;
--3. Show all customers names who have made payments over $175(use subqueries) 
select first_name,last_name 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);
--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, country 
from customer 
full join address  
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where country = 'Nepal'; 
--5. Which staff member had the most transactions? 
SELECT first_name, last_name, COUNT(amount)
FROM staff
LEFT JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
--6. How many movies of each rating are there? 
SELECT rating, COUNT(film_id) 
FROM film
GROUP BY rating
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select *
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 6.99
);
--8. How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0;

