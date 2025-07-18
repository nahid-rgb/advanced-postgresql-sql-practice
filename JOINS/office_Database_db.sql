-- Drop tables if they exist
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS family_member;

-- Create department table
CREATE TABLE department (
    dept_id VARCHAR(20) PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create manager table
CREATE TABLE manager (
    manager_id VARCHAR(20) PRIMARY KEY,
    manager_name VARCHAR(50),
    dept_id VARCHAR(20)
);

-- Create employee table (no foreign keys)
CREATE TABLE employee (
    emp_id VARCHAR(20) PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id VARCHAR(20),
    manager_id VARCHAR(20)
);

-- Create projects table
CREATE TABLE projects (
    project_id VARCHAR(20),
    project_name VARCHAR(100),
    team_member_id VARCHAR(20),
    PRIMARY KEY (project_id, team_member_id)
);

-- Create table
CREATE TABLE company (
    company_id VARCHAR(10) PRIMARY KEY,
    company_name VARCHAR(50),
    location VARCHAR(20)
);

-- Create table
CREATE TABLE family_member (
    member_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    parent_id VARCHAR(10)
);
-- Insert department data 
INSERT INTO department (dept_id, dept_name) VALUES 
('D1', 'IT'),
('D2', 'HR'),
('D3', 'Finance'),
('D4', 'Admin');

-- Insert manager data 
INSERT INTO manager (manager_id, manager_name, dept_id) VALUES 
('M1', 'Rohit Sharma', 'D3'),
('M2', 'Shakib Al Hasan', 'D4'),
('M3', 'Nick Jonas', 'D1'),
('M4', 'Cory Anderson', 'D1');

-- Insert employee data 
INSERT INTO employee (emp_id, emp_name, salary, dept_id, manager_id) VALUES 
('E1', 'Ratul Singh', 15000, 'D1', 'M1'),
('E2', 'Mahfujur Rahman', 15000, 'D1', 'M1'),
('E3', 'James Anderson', 55000, 'D2', 'M2'),
('E4', 'Michael Clarke', 25000, 'D2', 'M2'),
('E5', 'Ali Khan Aga', 20000, 'D10', 'M3'),
('E6', 'Robin van Persie', 35000, 'D10', 'M3');

-- Insert project data
INSERT INTO projects (project_id, project_name, team_member_id) VALUES 
('P1', 'Data Migration', 'E1'),
('P1', 'Data Migration', 'E2'),
('P1', 'Data Migration', 'M3'),
('P2', 'ETL Tool', 'E1'),
('P2', 'ETL Tool', 'M4');


-- Insert company data
INSERT INTO company (company_id, company_name, location)
VALUES ('COOI', 'ToTo Companay_420', 'DHAKA');

-- Insert family_member data
INSERT INTO family_member (member_id, name, age, parent_id) VALUES
('F1', 'David', 4, 'F5'),
('F2', 'Carol', 10, 'F5'),
('F3', 'Michael', 12, 'F5'),
('F4', 'Johnson', 40, ''),
('F5', 'Maryam', 70, 'F6'),
('F6', 'Stewart', 6, ''),
('F7', 'Rohan', 6, 'F4'),
('F8', 'Asha', 8, 'F4'); 




-- SELF JOIN 
-- Write a query to fetch the child name and their age correspodning to their parent name and parent name

SELECT 
  child.name AS child_name,
  child.age AS child_age,
  parent.name AS child_parent_name
FROM family_member AS child
JOIN family_member AS parent
ON child.parent_id = parent.member_id;

