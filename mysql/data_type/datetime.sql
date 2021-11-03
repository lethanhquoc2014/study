/**/
CREATE TABLE test_dt (
    id INT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME
);

/**/
INSERT INTO 
	test_dt(created_at)
VALUES
	('2021-11-03'),
	('2021-11-03 10:00:00'),
	(NOW());

/**/
SELECT
	*
FROM
	test_dt
WHERE
	created_at = '2021-11-03 05:20:13'

/**/
SELECT
	*
FROM
	test_dt
WHERE
	DATE(created_at) = '2021-11-03'

/**/
SELECT
	HOUR(created_at),
	MINUTE(created_at),
	SECOND(created_at),
	DAY(created_at),
	WEEK(created_at),
	MONTH(created_at),
	YEAR(created_at),
	QUARTER(created_at)
FROM
	test_dt
WHERE
	DATE(created_at) = '2021-11-03'