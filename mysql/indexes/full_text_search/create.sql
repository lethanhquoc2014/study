/*
Tạo chung khi tạo bảng
*/
CREATE TABLE posts (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    body TEXT,
    PRIMARY KEY (id),
    FULLTEXT KEY (body)
);

/*
Tạo bằng alter table
*/
ALTER TABLE posts ADD FULLTEXT(body)

/*
Tạo bằng create index
*/
CREATE FULLTEXT INDEX fti_body ON posts(body)
