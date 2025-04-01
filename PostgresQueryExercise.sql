--1
SELECT 
first_name
FROM
customer;

--2
SELECT 
first_name, 
last_name,
email
FROM
customer;

--3
SELECT *
FROM
customer;

--4
SELECT 
(first_name || ' ' || last_name) 
AS "Full Name",
email
FROM 
customer;

--5
SELECT first_name, 
last_name
FROM 
customer
ORDER BY
first_name;

--6
SELECT first_name,
last_name
FROM 
customer
ORDER BY 
first_name ASC,
last_name DESC;

--7
SELECT first_name,
LENGTH(first_name)
AS name_length 
FROM 
customer 
ORDER BY
name_length DESC;

--8
SELECT last_name, 
first_name
FROM 
customer
WHERE first_name = 'Jamie';

--9
SELECT last_name, 
first_name
FROM 
customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';

--10
SELECT first_name, 
last_name
FROM 
customer
WHERE last_name = 'Rodriguez' OR first_name = 'Adam';

--11
SELECT first_name,
last_name
FROM 
customer
WHERE first_name IN ('Ann', 'Anne', 'Annie');

--12
SELECT first_name, 
last_name
FROM 
customer
WHERE first_name LIKE 'Ann%';

--13
SELECT first_name, 
LENGTH(first_name) AS name_length
FROM 
customer
WHERE first_name 
LIKE 'A%' AND LENGTH
(first_name) BETWEEN 3 AND 5
ORDER BY name_length;

--14 
SELECT first_name,
last_name
FROM 
customer
WHERE first_name LIKE 'Bra%' AND last_name <> 'Motley';

--15
SELECT title, 
length,
rental_rate
FROM 
film
WHERE length > 180 AND rental_rate < 1;

--16
SELECT title,
rental_rate
FROM 
film
WHERE rental_rate = 0.99 OR rental_rate = 2.99;

--17 
SELECT film_id,
title,
release_year
FROM 
film
ORDER BY film_id
LIMIT 5;

--18 
SELECT film_id, 
title, 
release_year
FROM 
film
ORDER BY film_id
LIMIT 4 OFFSET 3;

--19 
SELECT film_id, 
title,
rental_rate
FROM
film
ORDER BY rental_rate DESC
LIMIT 10;

--20 
SELECT film_id, 
title
FROM
film
ORDER BY title ASC
FETCH FIRST 1 ROW ONLY;

--21
SELECT film_id, title 
FROM
film 
ORDER BY title ASC 
FETCH FIRST 5 ROWS ONLY;

--22
SELECT film_id, title
FROM
film
WHERE film_id IN (1, 2, 3);

--23
SELECT first_name, 
last_name
FROM 
actor
WHERE last_name IN ('Allen', 'Chase', 'Davis')
ORDER BY last_name ASC;

--24
SELECT payment_id, 
amount,
payment_date 
FROM 
payment 
WHERE payment_date::date IN ('2007-02-15', '2007-02-16');

--25
SELECT payment_id, 
amount 
FROM
payment 
WHERE payment_id BETWEEN 17503 AND 17505 
ORDER BY payment_id;

--26
SELECT payment_id, 
amount
FROM
payment 
WHERE payment_id NOT BETWEEN 17503 AND 17505 
ORDER BY payment_id;

--27 
SELECT payment_id,
amount,
payment_date 
FROM 
payment 
WHERE payment_date BETWEEN '2007-02-15' AND '2007-02-20' 
AND amount > 10 
ORDER BY payment_date;

--28
SELECT first_name, 
last_name 
FROM 
customer 
WHERE first_name LIKE '%er%' 
ORDER BY first_name;

--29
SELECT first_name,
last_name
FROM 
customer 
WHERE first_name LIKE '_her%' 
ORDER BY first_name;

--30 
SELECT first_name,
last_name
FROM
customer 
WHERE first_name NOT LIKE 'len%' 
ORDER BY first_name;

--31
SELECT first_name,
last_name 
FROM
customer 
WHERE first_name ILIKE 'BAR%';

--32
SELECT address,
address2
FROM 
address 
WHERE address2 IS NULL;

--33
SELECT address, 
address2
FROM 
address 
WHERE address2 IS NOT NULL;
