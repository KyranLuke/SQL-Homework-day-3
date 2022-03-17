create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR (100),
	email VARCHAR (200),
	address VARCHAR (150),
	city VARCHAR(100),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
	);
	
create table order_(
	order_id SERIAL primary key,
	order_date DATE default current_date,
	amount numeric(5,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(1,'George','Washington','gwash@usa.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(2,'John','Adams','jadams@usa.gov','1200 Hancock', 'Quincy', 'MA','02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(3,'Thomas','Jefferson', 'tjeff@usa.gov', '931 Thomas Jefferson Pkway', 'Charlottesville','VA','02169');

INSERt INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(4,'James','Madison', 'jmad@usa.gov', '11350 Conway','Orange','VA','02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(5,'James','Monroe','jmonroe@usa.gov','2050 James Monroe Parkway','Charlottesville','VA','02169');

INSERT INTO order_(order_id,amount,customer_id)
VALUES(1,234.56,1);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(2,78.50,3);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(3,124.00,2);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(4,65.50,3);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(5,55.50,NULL);

select * from customer;
select * from order_;

-- inner join
select first_name, last_name, order_date, amount 
from customer 
inner join order_ 
on customer.customer_id = order_.customer_id 

-- left join
select first_name, last_name, order_date, amount 
from customer 
left join order_
on customer.customer_id = order_.customer_id 
where order_date is not null

-- right join
select first_name, last_name, order_date, amount 
from customer 
right join order_
on customer.customer_id = order_.customer_id 

--full join 
select first_name, last_name, order_date, amount 
from customer 
full join order_
on customer.customer_id = order_.customer_id 














