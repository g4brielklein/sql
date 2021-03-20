-- DELETE MOST RECENT DATA 
DELETE FROM customers.customer1
WHERE date = (SELECT MAX(date) FROM customers.customer1);

-- INSERT NEW DATA
INSERT INTO customers.customer1
SELECT 
	week
	,id
	,product
	,price
	,date
FROM (
SELECT *
FROM customers.customer2
WHERE date = (SELECT MAX(date) FROM customers.customer2));