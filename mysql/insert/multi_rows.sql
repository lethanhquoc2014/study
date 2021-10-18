/*
MySQL returns the number of affected rows based on the action it performs:
    - If the new row is inserted, the number of affected rows is 1.
    - If the existing row is updated, the number of affected rows is 2.
    - If the existing row is updated using its current values, the number of affected rows is 0.
*/
INSERT
    productlines(productLine, textDescription, htmlDescription, image)
VALUES
    ('Toyota Lexus 1', 'Japanese car 1', null, null)
ON DUPLICATE KEY UPDATE
    textDescription = 'Luxury car',
    htmlDescription = 'Japanese car';