SELECT 
	DISTINCT(customer1.id) as id,
	CASE WHEN customer_list.id IS NULL THEN customer1.date ELSE '-' END AS date,
	CASE WHEN customer_list.id IS NULL THEN 'NO' ELSE 'YES' END AS exists,
	'Customer1' AS customer_name,
	NULL AS customer_description,
	customer1.price,
	customer1.quantity,
	customer1.average_price,
	customer1.base_id,
FROM (
SELECT 
	id,
	CAST(CAST(MIN(date) AS DATE) AS VARCHAR) AS date,
	CAST(sum(price) AS DECIMAL) AS valor,
	CAST(sum(quantity) AS DECIMAL) AS quantity,
	ROUND(CAST(sum(price) AS REAL) / NULLIF(sum(quantity), 0), 2) AS average_price,
	COUNT(DISTINCT(SUBSTRING(CAST(id as VARCHAR), 1, 8))) AS base_id,
FROM customers.customer1
GROUP BY id) customer1
LEFT JOIN customers.customer_list cl ON customer1.id = CAST(cl.id AS BIGINT)

/*
INNER JOIN customer.customer_list cl ON customer1.id = CAST(cl.id AS BIGINT)
*/
