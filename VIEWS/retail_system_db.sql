-- Just for safety: drop if exists
DROP TABLE IF EXISTS order_details, product_info, customer_data;

-- customer_data
CREATE TABLE customer_data (
    cust_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50),
    phone BIGINT,
    email VARCHAR(50),
    address VARCHAR(250)
);

INSERT INTO customer_data (cust_id, full_name, phone, email, address) VALUES
('C1', 'Nahid Hasan', 8801711123456, 'nahid@example.com', 'Dhaka'),
('C2', 'Tanjila Akter', 8801811123456, 'tanjila@example.com', 'Chittagong'),
('C3', 'Mizanur Rahman', 8801911987654, 'mizan@example.com', 'Khulna'),
('C4', 'Sohana Sultana', 8801600123456, 'sohana@example.com', 'Rajshahi');

-- product_info
CREATE TABLE product_info (
    prod_id VARCHAR(10) PRIMARY KEY,
    prod_name VARCHAR(50),
    brand VARCHAR(50),
    price INT
);

INSERT INTO product_info (prod_id, prod_name, brand, price) VALUES
('P1', 'Samsung S22', 'Samsung', 800),
('P2', 'Google Pixel 6 Pro', 'Google', 900),
('P3', 'Sony Bravia TV', 'Sony', 600),
('P4', 'Dell XPS 17', 'Dell', 2000),
('P5', 'iPhone 13', 'Apple', 800),
('P6', 'Macbook Pro 16', 'Apple', 5000);

-- order_details (no foreign key constraints)
CREATE TABLE order_details (
    order_id INT PRIMARY KEY,
    prod_id VARCHAR(10),
    quantity INT,
    cust_id VARCHAR(10),
    disc_percent INT,
    order_date DATE
);

INSERT INTO order_details (order_id, prod_id, quantity, cust_id, disc_percent, order_date) VALUES
(1, 'P1', 2, 'C2', 5, '2020-01-01'),
(2, 'P2', 1, 'C1', 10, '2020-02-01'),
(3, 'P4', 4, 'C3', 0, '2020-02-01'),
(4, 'P5', 1, 'C3', 15, '2020-03-01'),
(5, 'P6', 2, 'C4', 10, '2020-04-01'),
(6, 'P3', 1, 'C2', 0, '2020-05-01'),
(7, 'P2', 3, 'C1', 5, '2020-02-01'),
(8, 'P5', 1, 'C4', 20, '2020-06-01');
