-- Only delete on t3
DELETE
    t3
FROM
    t3
    INNER JOIN t4 ON t3.id = t4.ref
WHERE
    t3.id = 1

-- Only delete on t4
DELETE
    t4
FROM
    t3
    INNER JOIN t4 ON t3.id = t4.ref
WHERE
    t3.id = 1

-- Delete on t3,t4
DELETE
    t3, t4
FROM
    t3
    INNER JOIN t4 ON t3.id = t4.ref
WHERE
    t3.id = 1
