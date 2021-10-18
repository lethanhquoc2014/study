/*
The MINUS compares the results of two queries and returns distinct rows from the result set of the first query that does not appear in the result set of the second query.
The basic rules for a query that uses MINUS operator are the following:
+ The number and order of columns in both select_list1 and select_list2 must be the same.
+ The data types of the corresponding columns in both queries must be compatible.
*/

-- sample 1 not support on mysql 5.6
SELECT 
    id
FROM 
    t1
MINUS
SELECT
    id
FROM t2; 

-- sample 2
SELECT
    id
FROM
    t1
    LEFT JOIN t2 USING(id)
WHERE
    t2.id IS NULL