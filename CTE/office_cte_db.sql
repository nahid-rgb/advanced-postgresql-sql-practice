-- Drop tables if they already exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS sales;

CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

-- Create the table
CREATE TABLE sales (
    store_id INT,
    store_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price INT
);
-- Insert Employee Data 
INSERT INTO employee (emp_id, emp_name, salary) VALUES
(101, 'Nahid Hasan',42000),
(102, 'Tanvir Ahmed',46000),
(103, 'Mim Rahman',50000),
(104, 'Shuvo Karim',48000),
(105, 'Mehjabin Akter',39000),
(106, 'Naimur Rahman',55000),
(107, 'Sadia Zaman',47000),
(108, 'Arafat Hossain',52000),
(109, 'Tanjina Alam',49000),
(110, 'Faisal Mahmud',41000),
(111, 'Jannat Nahar',53000),
(112, 'Imran Hossain',57000),
(113, 'Sabina Yasmin',44000),
(114, 'Touhidul Islam',60000),
(115, 'Zannat Sultana',62000),
(116, 'Arman Chowdhury',49000),
(117, 'Sharmin Sultana',56000),
(118, 'Sabbir Ahmed',58000),
(119, 'Farzana Islam',39000),
(120, 'Mahmudul Hasan',37000),
(121, 'Rubina Akter',36000),
(122, 'Ishraq Rahman',40000),
(123, 'Tariq Aziz',5000),
(124, 'Hasna Hena',43000);

INSERT INTO sales (store_id, store_name, product, quantity, price) VALUES
(1, 'Apple Store 1', 'iPhone 13 Pro', 1, 1000),
(1, 'Apple Store 1', 'MacBook Pro 14', 1, 6000),
(1, 'Apple Store 1', 'AirPods Pro', 1, 500),
(2, 'Apple Store 2', 'iPhone 13 Pro', 2, 2000),
(3, 'Apple Store 3', 'iPhone 12 Pro', 3, 750),
(3, 'Apple Store 3', 'MacBook Pro 14', 3, 2000),
(4, 'Apple Store 4', 'iPad Air', 2, 1500),
(4, 'Apple Store 4', 'Apple Watch Series 8', 1, 800),
(2, 'Apple Store 2', 'iPhone SE', 4, 1200),
(3, 'Apple Store 3', 'AirPods Max', 2, 900),
(4, 'Apple Store 4', 'Mac Studio', 1, 2500),
(1, 'Apple Store 1', 'Magic Keyboard', 2, 300);
