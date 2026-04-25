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
