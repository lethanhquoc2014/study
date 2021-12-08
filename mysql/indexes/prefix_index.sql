/*
prefix index là tạo index cho một phần cho các cột có kiểu string như char, varchar, text.
*/

/*
Ví dụ tạo prefix index trên table products có sẵn.

Đếm số dòng trong table products: 120 dòng
SELECT
   COUNT(*)
FROM
   products;

Xác định số dòng duy nhất khi chỉ lấy một phần giá trị của cột productName: 120 dòng - như vậy OK
SELECT
   COUNT(DISTINCT LEFT(productName, 20)) unique_rows
FROM
   products;

*/

/* Tạo prefix index */
CREATE INDEX idx_productname ON products(productName(20))