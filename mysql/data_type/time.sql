CREATE TABLE tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_at TIME,
    end_at TIME
);

INSERT INTO
	tests(name,start_at,end_at)
VALUES
	('Test 1', '08:00:00','10:00:00'),
	('Test 2','083000','101500');

/*
lấy thời gian hiện tại
*/
SELECT CURRENT_TIME()

/*
Cộng và trừ thời gian
*/
SELECT
	CURRENT_TIME(),
	ADDTIME(CURRENT_TIME(), 023000),
	SUBTIME(CURRENT_TIME(), 023000)

/*
trừ giữa 2 thời gian
*/
SELECT
	TIMEDIFF(end_at, start_at)
FROM
	tests

/*
format time
*/
SELECT
	name,
	TIME_FORMAT(start_at, '%h:%i %p') start_at,
	TIME_FORMAT(end_at, '%h:%i %p') end_at
FROM
	tests

/*
extract hour, minute, second
*/
SELECT
	start_at,
	HOUR(start_at) hour,
	MINUTE(start_at) minute,
	SECOND(start_at) second
FROM
	tests