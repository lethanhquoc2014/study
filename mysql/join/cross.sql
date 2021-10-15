-- Suppose the first table has n rows and the second table has m rows. The cross join that joins the tables will return nxm rows.
SELECT
    *
FROM
    orders
    CROSS JOIN order_details