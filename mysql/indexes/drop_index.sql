CREATE TABLE leads(
    lead_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR(255),
    INDEX idx_first_name_last_name(first_name,last_name),
    UNIQUE email(email),
    PRIMARY KEY(lead_id)
);

DROP INDEX idx_first_name_last_name ON leads;

DROP INDEX idx_first_name_last_name ON leads;
ALGORITHM = INPLACE
LOCK = DEFAULT;

/*
ALGORITHM [=] {DEFAULT|INPLACE|COPY}
DEFAULT: là INPLACE
COPY: các row của table gốc sẽ được copy sang table mới và drop index thực hiện trên bảng copy.
trong quá trình xoá index thì read, write sẽ không được phép thực hiện
INPLACE: drop index sẽ được thực hiện trên chính bảng gốc, các thao tác read, write và các lệnh khác
vẫn được phép.
*/

/*
LOCK [=] {DEFAULT|NONE|SHARED|EXCLUSIVE}
DEFAULT: Cho phép bạn có mức độ đồng thời tối đa cho một thuật toán nhất định.
Đầu tiên nó cho phép đọc và ghi đồng thời nếu được hỗ trợ.
Nếu không nó cho phép đọc đồng thời nếu được hỗ trợ. Nếu không thì thực thi truy cập độc quyền.
NONE: nếu NONE được hỗ trợ, bạn có thể đọc và ghi đồng thời. Nếu không MySQL phát sinh lỗi.
SHARED: Nếu SHARED được hỗ trợ thì bạn có thể đọc đồng thời nhưng không ghi.
MySQL phát sinh lỗi nếu các lần đọc đồng thời không được hỗ trợ.
EXCLUSIVE: điều này thực thi quyền truy cập độc quyền.
*/