SELECT
	c.first_name AS customer_first_name,
	c.last_name AS customer_last_name,
	s.first_name AS staff_first_name,
	s.last_name AS staff_last_name,
	p.amount AS total_paid
FROM
	customer c
INNER JOIN payment p
	ON p.customer_id = c.customer_id
INNER JOIN staff s
	ON p.staff_id = s.staff_id
WHERE p.amount > (SELECT AVG(amount) FROM payment)
ORDER BY total_paid DESC