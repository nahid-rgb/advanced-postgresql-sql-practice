-- Drop tables if they already exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS store_products;
DROP TABLE IF EXISTS employee_history;

-- Create Department Table
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(100)
);

-- Create the table
CREATE TABLE store_products (
    store_id INT,
    store_name VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    price INT
);

-- Create Employee Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);
-- Create Employee History Table
CREATE TABLE employee_history(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT,
	location VARCHAR(100)
);

-- Insert Department Data
INSERT INTO department (dept_id, dept_name, location) VALUES
(1, 'Admin', 'Dhaka'),
(2, 'HR', 'Dhaka'),
(3, 'IT', 'Dhaka'),
(4, 'Finance', 'Chittagong'),
(5, 'Marketing', 'Khulna'),
(6, 'Sales', 'Chittagong');


-- Insert Employee Data 
INSERT INTO employee (emp_id, emp_name, dept_name, salary) VALUES
(101, 'Nahid Hasan',        'IT',         42000),
(102, 'Tanvir Ahmed',       'HR',         46000),
(103, 'Mim Rahman',         'Finance',    50000),
(104, 'Shuvo Karim',        'Sales',      48000),
(105, 'Mehjabin Akter',     'Marketing',  39000),
(106, 'Naimur Rahman',      'Admin',      55000),
(107, 'Sadia Zaman',        'HR',         47000),
(108, 'Arafat Hossain',     'IT',         52000),
(109, 'Tanjina Alam',       'Finance',    49000),
(110, 'Faisal Mahmud',      'Sales',      41000),
(111, 'Jannat Nahar',       'Admin',      53000),
(112, 'Imran Hossain',      'Marketing',  57000),
(113, 'Sabina Yasmin',      'HR',         44000),
(114, 'Touhidul Islam',     'IT',         60000),
(115, 'Zannat Sultana',     'Finance',    62000),
(116, 'Arman Chowdhury',    'Sales',      49000),
(117, 'Sharmin Sultana',    'Admin',      56000),
(118, 'Sabbir Ahmed',       'Marketing',  58000),
(119, 'Farzana Islam',      'HR',         39000),
(120, 'Mahmudul Hasan',     'IT',         37000),
(121, 'Rubina Akter',       'IT',         36000),
(122, 'Ishraq Rahman',      'Finance',    40000),
(123, 'Tariq Aziz',         'Marketing',  45000),
(124, 'Hasna Hena',         'Sales',      43000);

-- Insert 12 sample records with 4 Apple Stores
INSERT INTO store_products (store_id, store_name, product_name, quantity, price) VALUES
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
