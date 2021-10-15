-- Cách thông thường
SELECT
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline 
UNION ALL
SELECT
    NULL,
    SUM(orderValue) totalOrderValue
FROM
    sales;

-- Cách sử dụng rollup
SELECT
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline WITH ROLLUP

-- Tính tổng theo từng productLine, sau cùng là tổng cộng
SELECT
    productLine,
    orderYear,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline,
    orderYear
WITH ROLLUP;