-- https://leetcode.com/problems/customers-who-never-order/
SELECT name AS Customers
FROM customers
WHERE id NOT IN (
    SELECT customerid
    FROM orders
);
