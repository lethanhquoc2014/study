/*
char là kiểu dữ liệu cố định số ký tự, nếu insert quá số ký tự quy định thì sẽ bị báo lỗi.
*/
CREATE TABLE mysql_test_char(
	status CHAR(3)
)
INSERT INTO mysql_test_char VALUES
('yes'),
('no');

/* báo lỗi */
INSERT INTO mysql_test_char VALUES('completed')

/* xem độ dài các ký tự */
SELECT
	status,
	LENGTH(status) as status_length
FROM
	mysql_test_char

/* Đối với các toán tử so sánh =, <>, >, < thì mysql sẽ không tính các khoảng trắng cuối vào so sánh
câu query này vẫn trả về kết quả của status = c
không áp dụng cho toán tử LIKE
*/
SELECT
	*
FROM
	mysql_test_char
WHERE
	status = 'c '

/* câu query này sẽ trả về kết quả rỗng */
SELECT
	*
FROM
	mysql_test_char
WHERE
	status = ' c'