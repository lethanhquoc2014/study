INSERT
    productlines(productLine, textDescription, htmlDescription, image)
VALUES
    ('Toyota Lexus 1', 'Japanese car 1', null, null)
ON DUPLICATE KEY UPDATE
    textDescription = 'Luxury car',
    htmlDescription = 'Japanese car';