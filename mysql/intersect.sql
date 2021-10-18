/*
The INTERSECT operator compares the result sets of two queries and returns the distinct rows that are output by both queries.
To use the INTERSECT operator for two queries, you follow these rules:
+ The order and the number of columns in the select list of the queries must be the same.
+ The data types of the corresponding columns must be compatible.
*/
-- sample 1 not support on mysql 5.6
SELECT
    id
FROM 
    t1
INTERSECT
SELECT
    id
FROM t2;

-- sample 2
SELECT
    id
FROM
    t1
    INNER JOIN t2 USING(id);

-- sample 3
SELECT
    DISTINCT id
FROM
    t1
WHERE
    id IN (SELECT id FROM t2)