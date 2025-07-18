-- View all employees
SELECT * FROM employee;


-- Max salary per department using GROUP BY
SELECT dept_name, MAX(salary) AS max_salary 
FROM employee
GROUP BY dept_name;


-- Overall max salary (applies to entire company)
SELECT e.*,
       MAX(salary) OVER () AS max_salary
FROM employee e;


-- Max salary within each department (repeats for each dept)
SELECT *,
       MAX(salary) OVER (PARTITION BY dept_name) AS max_salary
FROM employee;



-- ROW_NUMBER(): Assigns unique row number, regardless of ties
-- Without partitioning
SELECT e.*, 
       ROW_NUMBER() OVER () AS row_num
FROM employee e;

-- Partitioned by department
SELECT e.*, 
       ROW_NUMBER() OVER (PARTITION BY dept_name) AS row_num
FROM employee e;

-- First 2 employees from each department (any order)
SELECT * 
FROM (
    SELECT e.*, 
           ROW_NUMBER() OVER (PARTITION BY dept_name) AS row_num
    FROM employee e
) AS x
WHERE x.row_num < 3;



-- RANK(): Ties get same rank, next rank is skipped
-- Top 3 salary earners in each department
SELECT * 
FROM (
    SELECT e.*, 
           RANK() OVER (PARTITION BY dept_name ORDER BY salary DESC) AS rank_num
    FROM employee e
) AS rnk
WHERE rnk.rank_num < 4;



-- DENSE_RANK(): Ties get same rank, next rank is NOT skipped
SELECT e.*,
       DENSE_RANK() OVER (PARTITION BY dept_name ORDER BY salary DESC) AS dense_rank_num
FROM employee e;


-- All three: ROW_NUMBER, RANK, DENSE_RANK side-by-side
SELECT e.*,
       ROW_NUMBER() OVER (PARTITION BY dept_name ORDER BY salary DESC) AS row_num,
       RANK() OVER (PARTITION BY dept_name ORDER BY salary DESC) AS rank_num,
       DENSE_RANK() OVER (PARTITION BY dept_name ORDER BY salary DESC) AS dense_rank_num
FROM employee e;



-- LAG(): See previous employee's salary (by emp_id) within same department
SELECT e.*, 
       LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) AS prev_emp_salary
FROM employee e;

-- LAG() with offset 2 and default value 0
SELECT e.*, 
       LAG(salary, 2, 0) OVER (PARTITION BY dept_name ORDER BY emp_id) AS prev_emp_salary
FROM employee e;



-- LEAD() + LAG() together
SELECT e.*,
       LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) AS prev_emp_salary,
       LEAD(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) AS next_emp_salary
FROM employee e;


-- Compare salary to previous employee using CASE + LAG
SELECT e.*,
       LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) AS prev_emp_salary,
       CASE
           WHEN salary > LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) THEN 'Higher than previous employee'
           WHEN salary < LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) THEN 'Lower than previous employee'
           WHEN salary = LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) THEN 'Same as previous employee'
       END AS sal_range
FROM employee e;
