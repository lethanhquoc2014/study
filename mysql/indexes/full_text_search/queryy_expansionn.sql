/*
WITH QUERY EXPANSION nên được sử dụng khi từ khoá tìm kiếm quá ngắn.
Ngoài kết quả là những dòng liên quan thì kết quả còn trả về những dòng với những từ tồn tại trong kết quả liên quan.
Ví dụ: những dòng liên quan trực tiếp của từ khoá 1992
thì cũng còn những dòng có từ Ferrari của 1992 nữa.
*/
SELECT
    productName
FROM
    products
WHERE
    MATCH(productName)
    AGAINST('1992' WITH QUERY EXPANSION)