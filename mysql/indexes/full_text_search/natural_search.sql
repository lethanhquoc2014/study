/*
There are some important points you should remember when using the full-text search:
- The minimum length of the search term defined in MySQL full-text search engine is 4. 
It means that if you search for the keyword whose length is less than 4 e.g., car, cat, you will not get any results.
- Stop words are ignored. MySQL defines a list of stop words in the MySQL source code distribution storage/myisam/ft_static.c
*/

/*
Để sử dụng được hàm MATCH() thì productLine phải được đánh index FULLTEXT search
Không phân biệt hoa, thường
nếu AGAINST không chỉ ra mode nào thì mặc định sẽ là IN NATURAL LANGUAGE MODE
*/
SELECT
    productName,
    productLine
FROM
    products
WHERE
    MATCH(productLine)
    AGAINST('classic')

/*
Query này tương tự như câu query ở trên
*/
SELECT
    productName,
    productLine
FROM
    products
WHERE
    MATCH(productLine)
    AGAINST('classic' IN NATURAL LANGUAGE MODE)

/*
search theo classic hoặc vintage
*/
SELECT
    productName,
    productLine
FROM
    products
WHERE
    MATCH(productLine)
    AGAINST('classic, vintage')

/*
Mysql sẽ ưu tiên trả về những rows có cả 2 key search 1932 và ford.
Sau đó là các dòng chỉ có 1 trong 2 key.
*/
SELECT
    productName,
    productLine
FROM
    products
WHERE
    MATCH(productName)
    AGAINST('1932,ford')