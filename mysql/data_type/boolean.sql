/*
Mặc dù đã tạo kiểu dữ liệu là boolean nhưng khi xem cấu trúc bảng thì mysql lại hiển thị là tinyint(1)
Tức là boolean hoặc bool tương đương với tinyint(1)
*/
create table tasks(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    completed boolean
)
--
SELECT
	*
FROM
	tasks
WHERE
	completed = TRUE
--
SELECT
	*
FROM
	tasks
WHERE
	completed = FALSE
--
SELECT
	*
FROM
	tasks
WHERE
	completed = 1
--
SELECT
	*
FROM
	tasks
WHERE
	completed = 0