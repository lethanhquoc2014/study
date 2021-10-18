-- First, the number and the orders of columns that appear in all SELECT statements must be the same.
-- Second, the data types of columns must be the same or compatible.
-- By default, the UNION operator removes duplicate rows even if you don’t specify the DISTINCT operator explicitly.
SELECT 
    id
FROM
    t1
UNION
SELECT
    id
FROM
    t2

-- sample 2
SELECT
    contactLastName, contactFirstName
FROM
    customers
UNION
SELECT
    lastName, firstName
FROM
    employees

-- sample 3
SELECT
    CONCAT(contactLastName, ' ', contactFirstName) AS fullname
FROM
    customers
UNION
SELECT
    CONCAT(lastName, ' ', firstName) AS fullname
FROM
    employees
ORDER BY
    fullname DESC