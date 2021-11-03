CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL
);

INSERT INTO 
	people(first_name,last_name,birth_date)
VALUES
	('Jack','Daniel','01-09-01'),
	('John','Doe','1990-09-01'),
    ('Lily','Bush','80-09-01');

/* 2021-11-02 21:15:06 */
SELECT NOW()

/* 2021-11-02 */
SELECT DATE(NOW())

/* 2021-11-02 */
SELECT CURDATE()

/* 02/11/2021 */
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y')

/* 365 day */
SELECT DATEDIFF('2021-11-02', '2020-11-02') AS day

/* Cộng thêm 1 ngày, 1 tuần... vào ngày start */
SELECT
    '2015-01-01' start,
    DATE_ADD('2015-01-01', INTERVAL 1 DAY) 'one day later',
    DATE_ADD('2015-01-01', INTERVAL 1 WEEK) 'one week later',
    DATE_ADD('2015-01-01', INTERVAL 1 MONTH) 'one month later',
    DATE_ADD('2015-01-01', INTERVAL 1 YEAR) 'one year later';

/* Trừ bớt 1 ngày, 1 tuần... vào ngày start */
SELECT 
    '2015-01-01' start,
    DATE_SUB('2015-01-01', INTERVAL 1 DAY) 'one day before',
    DATE_SUB('2015-01-01', INTERVAL 1 WEEK) 'one week before',
    DATE_SUB('2015-01-01', INTERVAL 1 MONTH) 'one month before',
    DATE_SUB('2015-01-01', INTERVAL 1 YEAR) 'one year before';

/* trả về ngày, tháng, năm, quý của ngày input */
SELECT 
    DAY('2000-12-31') AS day,
    MONTH('2000-12-31') AS month,
    YEAR('2000-12-31') AS year,
    QUARTER('2000-08-31') AS quarter

/*
- trả về sô thứ tự ngày trong tuần (0: t2, 1: t3...)
- số tuần trong năm
- số thứ tự của tuần trong năm
*/
SELECT
	WEEKDAY('2021-11-08') AS weekday,
	WEEK('2000-12-31') AS week,
	WEEKOFYEAR('2000-12-31') AS weekofyear