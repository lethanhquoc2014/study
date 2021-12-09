/*
index ẩn là index mặc dù có khai báo nhưng không được sử dụng vào tối ưu hoá câu query.

Tác dụng của index ẩn là để khi mình muốn ẩn index nào đó để xem hiệu quả thế nào, thay cho việc xoá rồi
tạo lại mất thời gian, có thể phát sinh lỗi. Thì việc ẩn đi hoặc bậc lại nếu cần sẽ tiện lợi hơn.
*/

CREATE INDEX idx_country ON offices(country) INVISIBLE

/* ẩn index đã tồn tại */
ALTER TABLE table_name
ALTER INDEX index_name [VISIBLE | INVISIBLE];
