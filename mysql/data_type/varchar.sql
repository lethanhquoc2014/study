/*
The length prefix specifies the number of bytes in the value. If a column requires less than 255 bytes,
the length prefix is 1 byte. In case the column requires more than 255 bytes, the length prefix is two length bytes.
*/
/*
Đối kiểu varchar thì độ dài của một dòng không quá 65,535 bytes.
Nếu độ dài dưới 255 bytes thì mysql sử dụng prefix độ dài 1 byte
Nếu độ dài trên 255 bytes thì mysql sử dụng prefix độ dài 2 bytes.
*/

/*
32765 + 2 + 32766 + 2 = 65535
Nên table tạo được
*/
CREATE TABLE IF NOT EXISTS varchar_test (
    s1 VARCHAR(32765) NOT NULL,
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;

/*
32766 + 2 + 32766 + 2 = 65536 > max(65535)
Khi tạo table sẽ bị lỗi: "Row size too large. The maximum row size for the used table type, not counting BLOBs, 
is 65535. This includes storage overhead, check the manual. You have to change some columns to TEXT or BLOBs"
*/
CREATE TABLE IF NOT EXISTS varchar_test_2 (
    s1 VARCHAR(32766) NOT NULL, -- error
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;

/*
Đối với kiểu varchar thì mysql sẽ không xoá khoảng trắng cuối từ nếu độ dài chưa tới hạn. Khi độ dài vượt giới hạn
thì mysql sẽ xoá khoảng trắng cuối, vẫn insert vào nhưng sẽ xuất thông báo warning.
*/

/*
Bảng này sẽ có tổng số bytes: 1 + 255 + 2 + 256 = 514 bytes
*/
CREATE TABLE IF NOT EXISTS varchar_test (
    s1 VARCHAR(255) NOT NULL,
    s2 VARCHAR(256) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;