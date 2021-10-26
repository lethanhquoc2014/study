/*
1. Lock READ
Cú pháp lock: LOCK TABLE xxx,yyy READ
Cú pháp unlock: UNLOCK TABLES
Một table đang ở chế độ lock READ thì:
- ở phiên làm việc đang lock table chỉ có thể đọc dữ liệu, nếu write thì sẽ bị báo lỗi.
- ở phiên làm việc khác thì cũng chỉ có thể đọc dữ liệu, còn nếu write dữ liệu thì sẽ không báo lỗi mà đưa
vào hàng đợi, khi nào phiên làm việc kia unlock thì sẽ insert dữ liệu vào.

2. Lock WRITE
Cú pháp lock: LOCK TABLE xxx,yyy WRITE
Cú pháp unlock: UNLOCK TABLES
Một table đang ở chế độ lock WRITE thì:
- ở phiên làm việc đang lock table có thể read và write dữ liệu bình thường
- ở phiên làm việc khác thì không thể nào read và write dữ liệu cho tới khi phiên làm việc kia unlock table

3. Để xem hàng đợi các task đang đợi unlock để thực hiện thì chạy câu lệnh
SHOW FULL PROCESSLIST
*/