SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM projects;
SELECT * FROM company;
SELECT * FROM family_member;

-- Part 1
-- Fetch the employee name and the department name they belong to.

-- INNER JOIN / JOIN

SELECT emp.emp_name, dep.dept_name
FROM employee AS emp
INNER JOIN department AS dep 
ON emp.dept_id = dep.dept_id;

-- Fetch all the employee name and the department name they belong to.
-- LEFT JOIN 
-- left join ==> left outer join
-- left join inner join + any additional records in the left table.

SELECT emp.emp_name, dep.dept_name
FROM employee AS emp 
LEFT JOIN department as dep 
ON emp.dept_id = dep.dept_id;	 



-- RIGHT JOIN
-- rightjoin ==> inner join + any additional records in the right table.
-- right join ==> right outer join
SELECT emp.emp_name, dep.dept_name, m.manager_id
FROM employee AS emp 
RIGHT JOIN department as dep 
ON emp.dept_id = dep.dept_id;	 



-- Fetch details of ALL employee, their manager, their department and the projects they work on.
SELECT emp.emp_name, dep.dept_name, m.manager_name, p.project_name
FROM (
    (
        employee AS emp 
        LEFT JOIN department AS dep ON emp.dept_id = dep.dept_id
    ) 
    INNER JOIN manager AS m ON emp.manager_id = m.manager_id
)
LEFT JOIN projects AS p ON emp.emp_id = p.team_member_id;








-- Part 2

-- FULL JOIN / FULL OUTER JOIN  = INNER JOIN
-- + all remaining records from Left Table (returns null value for any columns fetch
-- + all remaining records from Right Table (returns null value for any columns fetc

SELECT emp.emp_name, dep.dept_name
FROM employee AS emp 
FULL OUTER JOIN department as dep 
ON emp.dept_id = dep.dept_id;	 



-- CROSS JOIN
-- CROSS JOIN returns cartesian product.
SELECT emp.emp_name, dep.dept_name
FROM employee emp -- 6 records
CROSS JOIN department dep; -- 4 records


-- Write a query to fetch the employee name and their Eorresponding department name.
-- Also make sure to di splay the company name and the company location correspodning to each employee.

SELECT emp.emp_name, dep.dept_name, c.company_name, c.location
FROM employee AS emp
INNER JOIN department AS dep 
ON emp.dept_id = dep.dept_id
CROSS JOIN company c;



-- NATURAL JOIN 

SELECT emp.emp_name, dep.dept_name
FROM employee AS emp
NATURAL JOIN department AS dep;

-- NOTE:
-- NATURAL JOIN automatically joins tables based on columns with the same names.
-- In this case, it uses 'dept_id' which must exist in both employee and department.

-- BUT if you rename the 'dept_id' column in department (e.g., to 'id'):
-- ALTER TABLE department RENAME COLUMN dept_id TO id;

-- Then NATURAL JOIN won't find any common column,
-- so instead of performing a proper join, it behaves like a CROSS JOIN,
-- producing a cartesian product (every employee with every department).




-- SELF JOIN 
-- Write a query to fetch the child name and their age correspodning to their parent name and parent name

SELECT 
  child.name AS child_name,
  child.age AS child_age,
  parent.name AS child_parent_name
FROM family_member AS child
JOIN family_member AS parent
ON child.parent_id = parent.member_id;