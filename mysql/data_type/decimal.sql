/*
DECIMAL(P,D)
P: có max tối đa 65 chữ số
D: có max tối đa là 30, và D <= P

ví dụ: decimal(6,2) có tất cả 6 con số = 4 số kiểu int + 2 số thập phân

Cách tính byte của kiểu decimal: Tuỳ thuộc vào có bn chữ số
0: 0 byte
1-2: 1 byte
3-4: 2 byte
5-6: 3 byte
7-9: 4 byte

ví dụ: decimal(19,9) = (4 + 1 + 4) = 9 byte
*/
CREATE TABLE materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cost DECIMAL(6,2),
    price DECIMAL(6,2) ZEROFILL
);

INSERT INTO 
	materials (cost, price)
VALUES
	(1.23, 1.23),
	(9999, 9999),
	(9999.9, 9999.9)