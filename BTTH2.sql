CREATE DATABASE BOOKWORM;

USE BOOKWORM;

-- Tạo bảng AUTHORS
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT CHECK (birth_year > 0),
    nationality VARCHAR(50)
);

-- Tạo bảng BOOKS
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year INT CHECK (publish_year > 0),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Tạo bảng CUSTOMERS
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

-- Thêm dữ liệu cho bảng AUTHORS
INSERT INTO authors (full_name, birth_year, nationality)
VALUES
('Nguyễn Nhật Ánh', 1955, 'Việt Nam'),
('Arthur Conan Doyle', 1859, 'Anh'),
('Dale Carnegie', 1888, 'Mỹ');

-- Thêm dữ liệu cho bảng BOOKS
INSERT INTO books (book_name, category, author_id, price, publish_year)
VALUES
('Cho tôi xin một vé đi tuổi thơ', 'Văn học', 1, 85000, 2008),
('Mắt biếc', 'Văn học', 1, 90000, 1990),
('Tôi thấy hoa vàng trên cỏ xanh', 'Văn học', 1, 95000, 2010),
('Sherlock Holmes: Vụ án bí ẩn', 'Trinh thám', 2, 120000, 1892),
('Dấu vết tội ác', 'Trinh thám', 2, 110000, 1893),
('Đắc nhân tâm', 'Kỹ năng', 3, 100000, 1936),
('Quẳng gánh lo đi và vui sống', 'Kỹ năng', 3, 95000, 1948),
('Nghệ thuật nói trước công chúng', 'Kỹ năng', 3, 105000, 1956);

-- Thêm dữ liệu cho bảng CUSTOMERS
INSERT INTO customers (full_name, email, phone)
VALUES
('Trần Minh Khang', 'khangtran@gmail.com', '0901234567'),
('Lê Thị Hồng', 'hongle@gmail.com', '0902345678'),
('Phạm Quốc Anh', 'anhpham@gmail.com', '0903456789'),
('Nguyễn Văn Tài', 'tai.nguyen@gmail.com', '0904567890'),
('Võ Thị Mai', 'mai.vo@gmail.com', '0905678901');

-- Kiểm tra ràng buộc trùng email
-- Câu lệnh này sẽ gây lỗi vì email đã tồn tại trong bảng(lưu ý phải chạy hết trên trước)
INSERT INTO customers (full_name, email, phone)
VALUES ('Ngô Thanh Bình', 'khangtran@gmail.com', '0906789012');
