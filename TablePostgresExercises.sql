-- 1. Retrieve first 5 film titles using table alias
SELECT f.title
FROM film f
ORDER BY f.title ASC
LIMIT 5;

-- 2. INNER JOIN customer and payment tables (standard and USING syntax)
-- Standard syntax
SELECT c.customer_id, c.first_name, p.amount, p.payment_date
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.payment_date DESC;

-- USING syntax
SELECT customer_id, c.first_name, p.amount, p.payment_date
FROM customer c
INNER JOIN payment p USING (customer_id)
ORDER BY p.payment_date DESC;

-- 3. LEFT JOIN film and inventory tables (standard and USING syntax)
-- Standard syntax
SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
ORDER BY f.title;

-- USING syntax
SELECT film_id, f.title, i.inventory_id
FROM film f
LEFT JOIN inventory i USING (film_id)
ORDER BY f.title;

-- 4. LEFT JOIN with WHERE to find films with no inventory
SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL
ORDER BY f.title;

-- 5. RIGHT JOIN to get all films with or without inventory
SELECT f.film_id, f.title, i.inventory_id
FROM inventory i
RIGHT JOIN film f ON i.film_id = f.film_id
ORDER BY f.title ASC;

-- 6. RIGHT JOIN with WHERE to find films with no inventory (USING syntax)
SELECT f.film_id, f.title, i.inventory_id
FROM inventory i
RIGHT JOIN film f USING (film_id)
WHERE i.inventory_id IS NULL
ORDER BY f.title ASC;

-- 7. Self-join to find film pairs with same length (no duplicates)
SELECT f1.title AS film1, f2.title AS film2, f1.length
FROM film f1
INNER JOIN film f2 ON f1.length = f2.length AND f1.film_id > f2.film_id
ORDER BY f1.length;

-- 8. FULL OUTER JOIN for employees and departments (example with staff and store)
SELECT s.staff_id, s.first_name, s.last_name, st.store_id
FROM staff s
FULL OUTER JOIN store st ON s.staff_id = st.manager_staff_id;

-- 9. FULL OUTER JOIN with WHERE to find departments with no employees (example)
SELECT st.store_id
FROM staff s
FULL OUTER JOIN store st ON s.staff_id = st.manager_staff_id
WHERE s.staff_id IS NULL;

-- 10. FULL OUTER JOIN with WHERE to find employees not assigned to any department (example)
SELECT s.staff_id, s.first_name, s.last_name
FROM staff s
FULL OUTER JOIN store st ON s.staff_id = st.manager_staff_id
WHERE st.store_id IS NULL;

-- 11. NATURAL JOIN between products and categories (example with film and language)
SELECT *
FROM film
NATURAL JOIN language;

-- 12. GROUP BY to get distinct customer IDs from payments
SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY customer_id ASC;

-- 13. GROUP BY with SUM() for total payments per customer
SELECT customer_id, SUM(amount) AS total_payments
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- 14. GROUP BY with ORDER BY to sort customers by total payments (descending)
SELECT customer_id, SUM(amount) AS total_payments
FROM payment
GROUP BY customer_id
ORDER BY total_payments DESC;

-- 15. GROUP BY with JOIN to show customer names and total payments
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS full_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, full_name
ORDER BY total_payments DESC;

-- 16. GROUP BY with COUNT() for payments processed by staff
SELECT staff_id, COUNT(*) AS payment_count
FROM payment
GROUP BY staff_id;

-- 17. GROUP BY multiple columns for staff-customer payment analysis
SELECT customer_id, staff_id, SUM(amount) AS total_payments
FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id;

-- 18. GROUP BY with date functions for daily payment totals
SELECT DATE(payment_date) AS payment_day, 
       SUM(amount) AS daily_total,
       COUNT(*) AS transaction_count
FROM payment
GROUP BY payment_day
ORDER BY payment_day DESC;

-- 19. GROUP BY with SUM() and HAVING for customers spending > $200
SELECT customer_id, SUM(amount) AS total_payments
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200
ORDER BY total_payments DESC;

-- 20. GROUP BY with COUNT() and HAVING for stores with > 300 customers
-- Note: This assumes a customer-store relationship exists in the database
-- Since dvdrental doesn't have a direct store-customer table, here's an alternative:
SELECT store_id, COUNT(*) AS customer_count
FROM customer
GROUP BY store_id
HAVING COUNT(*) > 300;



