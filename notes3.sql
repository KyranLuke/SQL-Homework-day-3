-- INNER JOIN THE ACTOR AND FLIM ACTOR TABLE 
select actor.actor_id, first_name, last_name, film_id
from film_actor
inner join actor 
on actor.actor_id = film_actor.actor_id
 
-- left join on the actor and film actor table
select actor.actor_id, first_name, last_name, film_id
from film_actor
left join actor 
on actor.actor_id = film_actor.actor_id
--where first_name is null and last_name is null;

-- join that will produce info about a customer from the country of Angola
select customer.first_name, customer.last_name, customer.email, country 
from customer 
full join address  
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where country = 'Angola';

--sub?

-- two ? split apart

--find a customer id that has a amount greater than 175 in total payment
select customer_id
from payment 
group by customer_id 
having sum(amount) > 175
order by sum(amount) desc;

select * from customer  

select store_id,first_name,last_name 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

group by store_id, first_name, last_name;

-- basic sub?

select *
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

-- another basic sub? where all flim in english

select *
from film 
where language_id in (
	select language_id 
	from language  
	where name = 'English'
);






