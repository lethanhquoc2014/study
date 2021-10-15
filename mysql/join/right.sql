-- Cách 1:
SELECT
    *
FROM
    orders
    RIGHT JOIN order_details ON orders.orderNumber = order_details.orderNumber

-- Cách 2
SELECT
    *
FROM
    orders
    RIGHT JOIN order_details USING(orderNumber)