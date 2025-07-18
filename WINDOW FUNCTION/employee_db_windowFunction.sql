DROP TABLE IF EXISTS employee;

-- Create Employee Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);

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
(120, 'Mahmudul Hasan',     'IT',         52000),
(121, 'Rubina Akter',       'IT',         36000),
(122, 'Ishraq Rahman',      'Finance',    40000),
(123, 'Tariq Aziz',         'Marketing',  45000),
(124, 'Hasna Hena',         'Sales',      43000);