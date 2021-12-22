SELECT
    productName,
    productLine
FROM
    products
WHERE
    MATCH(productName)
    AGAINST('Truck' IN BOOLEAN MODE)

/*
Chỉ lấy những row có Truck nhưng không có Pickup
*/
SELECT
    productName,
    productLine
FROM
    products
WHERE
    MATCH(productName)
    AGAINST('Truck -Pickup' IN BOOLEAN MODE)

/*
Một số toán tử search boolean. Ví dụ: tìm những dòng có ít nhất một trong 2 từ khoá ‘mysql tutorial’
‘+mysql +tutorial’: search những dòng chứa cả 2 từ
‘+mysql tutorial’: search những dòng có từ mysql, nhưng những dòng có tutorial sẽ có thứ hạn cao hơn.
‘+mysql -tutorial’: search những dòng có mysql, nhưng ko có tutorial
‘+mysql ~tutorial’: search những dòng có mysql, nhưng nếu chứa tutorial thì sẽ có thứ hạng thấp hơn.
‘+mysql +(>tutorial <training)’: search những dòng có chứa mysql và tutorial hoặc mysql và training 
nhưng những dòng mysql tutorial sẽ có thứ hạn cao hơn những dòng có mysql training
‘my*’: tìm những dòng bắt đầu với từ my
*/