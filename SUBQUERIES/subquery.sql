SELECT * FROM employee;
SELECT * FROM department;


-- What is a Sub—Query? How does SQL process a Statement containing sub—query?
-- QUESTION: Find the employees who's salary is more than the average salary earned by all the employees
-- 1. find the avg salary 
-- 2. filter the employee based on the above result.

SELECT * -- outer query/ main query 
FROM employee
WHERE salary > (SELECT AVG(salary)FROM employee) -- subquery/ inner query


-- Scalar subquery 
-- it always returns 1 row and 1 column.
-- this query is identical as the previous query output
SELECT * 
FROM employee AS emp
JOIN (
    SELECT AVG(salary) AS sal 
    FROM employee
) AS avg_sal
ON emp.salary > avg_sal.sal;

select * from manager;


-- multiple row subquery 
-- type1 : subquery which returns multiple columns and multiple rows 
-- type2 : subquery which returns only 1 column and multiple rows.

-- type1:
-- QUESTION: Find the employees who earn the highest salary in each departmenft.

SELECT dept_name, max(salary)  
FROM employee
GROUP BY dept_name;


SELECT * 
FROM employee
WHERE (dept_name,salary) in (SELECT dept_name, max(salary)  
                              FROM employee
                              GROUP BY dept_name);

-- type2:
-- QUESTION: Find department who do not have any employees.

SELECT * 
FROM department 
WHERE dept_name NOT IN (SELECT distinct dept_name
              FROM employee);


-- Correlated subquery
-- A subquery which is related to the outer query.
/* QUESTION : Find the employees in each department who arn more than the average salary in that department */

-- SELECT AVG(salary) FROM employee WHERE dept_name = "specific_dept"

SELECT *
FROM employee AS outQ
WHERE salary >(SELECT AVG(salary)
               FROM employee AS inQ
               WHERE inQ.dept_name = outQ.dept_name
              );


/* QUESTION: Find department who do not have any employees */

SELECT *
FROM department AS dep
WHERE NOT EXISTS (SELECT 1
                  FROM employee AS emp
                  WHERE emp.dept_name = dep.dept_name);
 
-- In a NOT EXISTS subquery, we use SELECT 1 (or any constant) because we don't need actual data — 
-- we only care whether at least one matching row exists in the subquery result.








-- Nested subquery (subquery inside a subquery)
/* QUESTION: Find stores who's sales where better than the average sales accross all stores*/

SELECT * FROM store_products;

-- 1. find the total sales for each store.
-- 2. find avg sales for the stores.
-- 3. compare 1 & 2

SELECT * 
FROM (
    SELECT store_name, SUM(price) AS total_sales_by_store
    FROM store_products
    GROUP BY store_name
) AS sales 

JOIN (
    SELECT AVG(total_sales_by_store) AS avg_of_total_sales_by_store
    FROM (
        SELECT store_name, SUM(price) AS total_sales_by_store
        FROM store_products
        GROUP BY store_name
    ) AS per_store_sales
) AS avg_result
ON sales.total_sales_by_store > avg_result.avg_of_total_sales_by_store;


-- if same subquery repeat its best to use with clause 

WITH sales as 
(SELECT store_name, SUM(price) AS total_sales_by_store
        FROM store_products
        GROUP BY store_name)

SELECT *
FROM sales

JOIN (SELECT AVG(total_sales_by_store) AS avg_of_total_sales_by_store
      FROM sales AS per_store) AS avg_result
ON sales.total_sales_by_store > avg_result.avg_of_total_sales_by_store;







-- Different SQL Clause Where subquery is allowed to use 

-- SELECT 
-- FROM 
-- WHERE 
-- HAVING



-- Using a subquery in SELECT clause (not recommended to use a subquery in SELECT clause)

/* QUESTION: Fetch all employee details and add remarks to those employees who earn more than the average pay */


SELECT *,
        (CASE WHEN salary > (SELECT AVG(salary) FROM employee)
		 THEN 'Higher than Average'
		 ELSE null
		 END ) AS remarks
FROM employee;	 



-- same query without subquery in select clause 

--  this is much better than the above query
SELECT *,
       (CASE WHEN salary > avg_salary.sal
             THEN 'Higher than Average'
             ELSE NULL
        END) AS remarks
FROM employee
CROSS JOIN (
    SELECT AVG(salary) AS sal
    FROM employee
) AS avg_salary;
 
-- Using a subquery in  HAVING clause
/* QUESTION: Find the stores who have sold more units than the average units sold by all stores */


SELECT store_name, SUM(quantity)
FROM store_products
GROUP BY store_name
HAVING SUM(quantity) > (SELECT AVG(quantity) 
                       FROM store_products);




-- Different SQL Commands Which allow subquery

-- SQL Query => done
-- INSERT
-- UPDATE
-- DELETE


-- INSERT
/* QUESTION: Insert data to employee history table. Make sure not insert duplicate records.*/



SELECT * FROM employee_history;

INSERT INTO employee_history
SELECT emp.emp_id, emp.emp_name, emp.dept_name, emp.salary, dep.location
FROM employee AS emp 
JOIN department AS dep
ON emp.dept_name = dep.dept_name
WHERE NOT EXISTS (SELECT 1
                  FROM employee_history AS eh
				  WHERE eh.emp_id = emp.emp_id);
				  

-- UPDATE
/* QUESTION: Give 10% increment to employees in DHAKA location based on the maximum
salary earned by an emp in each dept. Only consider employees in employee_history table. */

UPDATE employee AS emp
SET salary = (SELECT MAX(salary) + (MAX(salary) * 0.1)
              FROM employee_history AS eh 
			  WHERE eh.dept_name = emp.dept_name)

WHERE emp.dept_name IN (SELECT dept_name
                        FROM department 
						WHERE location = 'Dhaka')

AND emp.emp_id IN (SELECT emp_id 
                   FROM employee_history
				  );







-- DELETE
/*QUESTION: Delete departments who do not have any employees.*/

 
DELETE FROM department 
WHERE dept_name NOT IN (SELECT DISTINCT dept_name
                        FROM employee);

-- or this can solve the above way 
DELETE FROM department 
WHERE dept_name IN (SELECT dept_name
                    FROM department AS dep
                    WHERE NOT EXISTS (SELECT 1
                                       FROM employee AS emp
				                       WHERE emp.dept_name = dep.dept_name));



