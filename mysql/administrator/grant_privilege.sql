/*
Gán tất cả quyền cho user vừa tạo
*/
GRANT ALL PRIVILEGES ON *.* TO quoc@localhost

/*
Chỉ gán quyền cho 1 database classicmodels
*/
GRANT ALL PRIVILEGES ON classicmodels.* TO quoc@localhost

/*
gán quyền select trên table employees của database classicmodels
*/
GRANT SELECT ON classicmodels.employees TO trang@localhost

/*
Privilege level trong mysql: global, database, table, column, stored, routine, proxy
*/