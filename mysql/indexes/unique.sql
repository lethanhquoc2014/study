CREATE TABLE users (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(100) NULL,
    address VARCHAR(255) NULL,
    PRIMARY KEY(id),
    CONSTRAINT uk_email UNIQUE(email)
)

SHOW INDEX FROM users
DROP INDEX uk_email ON users
ALTER TABLE users ADD CONSTRAINT uk_email UNIQUE(email)
ALTER TABLE users DROP INDEX uk_email