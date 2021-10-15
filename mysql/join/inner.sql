-- Cách 1:
SELECT
    *
FROM
    orders 
    INNER JOIN order_details ON orders.orderNumber = order_details.orderNumber
WHERE
    orders.orderNumber = 10106

SELECT
    *
FROM
    orders
    JOIN order_details ON orders.orderNumber = order_details.orderNumber
WHERE
    orders.orderNumber = 10106

-- Cách 2
SELECT
    *
FROM
    orders
    INNER JOIN order_details USING(orderNumber)
WHERE 
    orders.orderNumber = 10106

SELECT
    *
FROM
    orders
    JOIN order_details USING(orderNumber)
WHERE 
    orders.orderNumber = 10106