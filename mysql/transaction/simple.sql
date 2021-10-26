START TRANSACTION

    SELECT
        @orderNumber := MAX(orderNumber) + 1
    FROM
        orders

    INSERT INTO
        orders(orderNumber, orderDate, requiredDate, shippedDate, status, customerNumber)
    VALUES
        (@orderNumber, '2005-05-31', '2005-06-10', '2005-06-11', 'In Process', 145);

    INSERT INTO
        orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
    VALUES
        (@orderNumber,'S18_1749', 30, '136', 1),
        (@orderNumber,'S18_2248', 50, '55.09', 2);

COMMIT