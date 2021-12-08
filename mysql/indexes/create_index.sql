/* Tạo index khi tạo table */
CREATE TABLE t5(
   c1 INT PRIMARY KEY,
   c2 INT NOT NULL,
   c3 INT NOT NULL,
   c4 VARCHAR(10),
   INDEX (c2,c3) 
);
SHOW INDEXES FROM t5

/* Tạo index cho table đã tồn tại */
CREATE TABLE t6(
   c1 INT PRIMARY KEY,
   c2 INT NOT NULL,
   c3 INT NOT NULL,
   c4 VARCHAR(10)
);
CREATE INDEX idx_c2_c3 ON t6(c2,c3)
SHOW INDEXES FROM t6