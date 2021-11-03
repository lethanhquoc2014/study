CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

/*
Khi sử dụng kiểu ENUM thì mysql sẽ tự động tạo index cho những giá trị liệt kê
1 => Low
2 => Medium
3 => High
*/
SELECT
	*
FROM
	tickets
WHERE
	priority = 1

/*
truy vấn bình thường
*/
SELECT
	*
FROM
	tickets
WHERE
	priority = 'High'

/*
truy vấn dựa vào index
trả về kết quả priority = 'Low'
*/
SELECT
	*
FROM
	tickets
WHERE
	priority = 1

/*
Kiểu liệt kê không phân biệt hoa thường
Như câu query này vẫn trả về kết quả priority = 'Low'
*/
SELECT
	*
FROM
	tickets
WHERE
	priority = 'LOw'