INSERT
    suppliers(supplierNumber, supplierName, phone, addressLine1, addressLine2, city, state, postalCode, country, customerNumber)
SELECT
    customerNumber,
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
FROM
    customers
WHERE
    country = 'USA'
    AND 
    state = 'CA';

	