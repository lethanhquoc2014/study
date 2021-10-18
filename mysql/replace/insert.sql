-- Not duplicate primary key, insert manually
REPLACE INTO
    cities(id, name, population)
VALUES
    (5, 'California', 9874747)

/*
Duplicate key. Two actions happen:
- Deleted row (5, 'California', 9874747)
- Inserted row (5, 'Toronto', 10000)
*/
REPLACE INTO
	cities(id, name, population)
VALUES
    (5, 'Toronto', 10000)