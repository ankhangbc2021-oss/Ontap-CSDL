CREATE DATABASE CINE_MAGIC;

USE CINE_MAGIC;

-- Tạo bảng movies
CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL,
    age_restriction INT DEFAULT 0 CHECK (age_restriction IN (0, 13, 16, 18))
);

-- Tạo bảng rooms
CREATE TABLE rooms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    max_seats INT NOT NULL CHECK (max_seats > 0),
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'maintenance'))
);

-- Tạo bảng showtimes
CREATE TABLE showtimes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    room_id INT NOT NULL,
    show_time DATETIME NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL CHECK (ticket_price >= 0),
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE
);

-- Tạo bảng bookings
CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    showtime_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id) ON DELETE CASCADE
);

-- Thêm 4 bộ phim đang hot
INSERT INTO movies (title, duration_minutes, age_restriction)
VALUES
('Dune: Part Two', 166, 13),
('Kung Fu Panda 4', 94, 0),
('Godzilla x Kong: The New Empire', 115, 16),
('Deadpool & Wolverine', 128, 18);

-- Thêm 3 phòng chiếu (1 phòng bảo trì)
INSERT INTO rooms (name, max_seats, status)
VALUES
('Phòng 1 - IMAX', 150, 'active'),
('Phòng 2 - 3D', 120, 'active'),
('Phòng 3 - VIP', 80, 'maintenance');

-- Thêm 5 lịch chiếu (không dùng phòng bảo trì)
INSERT INTO showtimes (movie_id, room_id, show_time, ticket_price)
VALUES
(1, 1, '2026-05-01 14:00:00', 120000),
(2, 2, '2026-05-01 16:30:00', 90000),
(3, 1, '2026-05-01 19:00:00', 110000),
(4, 2, '2026-05-01 21:30:00', 130000),
(1, 1, '2026-05-02 10:00:00', 120000);

-- Thêm 10 vé đặt rải rác cho các lịch chiếu khác nhau
INSERT INTO bookings (showtime_id, customer_name, phone)
VALUES
(1, 'Nguyễn Văn A', '0901234567'),
(1, 'Trần Thị B', '0912345678'),
(2, 'Lê Văn C', '0923456789'),
(2, 'Phạm Thị D', '0934567890'),
(3, 'Hoàng Văn E', '0945678901'),
(3, 'Đỗ Thị F', '0956789012'),
(4, 'Vũ Văn G', '0967890123'),
(4, 'Ngô Thị H', '0978901234'),
(5, 'Bùi Văn I', '0989012345'),
(5, 'Phan Thị K', '0990123456');
