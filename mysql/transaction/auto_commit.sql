-- Active auto commit
SET AUTOCOMMIT = 1
SET AUTOCOMMIT = TRUE;

-- Disable auto commit
SET AUTOCOMMIT = 0;
SET AUTOCOMMIT = FALSE;

-- xem giá trị autocommitt
SHOW VARIABLES WHERE Variable_name='autocommit';

/*
Mặc định thì autocommit  = 1, tức là tự động commit. Nhưng để test được transaction thì phải sét autocommit = 0;
Do đó, khi insert, update data muốn thực hiện được thì phải sử dụng commit.
*/