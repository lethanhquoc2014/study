-- Delete all rows on t4 that they matched with t3
DELETE
    t4
FROM
    t4
    LEFT JOIN t3 on t4.ref = t3.id
