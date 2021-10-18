-- If you use the UNION ALL explicitly, the duplicate rows, if available, remain in the result.
-- Because UNION ALL does not need to handle duplicates, it performs faster than UNION DISTINCT .
SELECT
    id
FROM
    t1
UNION ALL
SELECT
    id
FROM
    t2