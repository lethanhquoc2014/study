/*
Duplicate unique key. Two actions happen:
- Deleted row (2, 2, 'title 2')
- Inserted row (2, 2, 'title 22')
*/
REPLACE INTO
    p1
SET
    type_id = 2,
    title = 'title 22'