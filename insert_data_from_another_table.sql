INSERT INTO customers.customer1
SELECT CONCAT('X_',REPLACE(id, '0')) AS id
,CAST(DATE_PARSE(CONCAT(SUBSTR(REPLACE(week, '"'),2,4),SUBSTR(week, -2)), '%x%v') AS DATE) AS week
,*
FROM customers.customer2
WHERE date = (SELECT MAX(date) FROM customers.customer2)
AND product NOT IN ('Product 1'
,'Product 2'
,'Product 3')
