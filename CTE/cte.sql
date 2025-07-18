SELECT * FROM employee;
-- Fetch employees who earn more than avaerage salary Of all employees

WITH average_salary (avg_salary) AS (
    SELECT CAST(AVG(salary) AS INT)
    FROM employee
)
SELECT *
FROM employee AS emp
JOIN average_salary AS av
ON emp.salary > av.avg_salary;


-- Find stores who's sales where better than the average sales accross all stores
SELECT * FROM sales;

-- 1. Total sales per each store -- Total_sales 

SELECT sal.store_id, SUM(price) AS total_sales_per_store
FROM sales AS sal
GROUP BY sal.store_id;

-- 2. Find the average sales with respect to all the stores -- Avg_sales

SELECT CAST(AVG(total_sales_per_store) AS INT ) AS avg_sales_for_all_stores
FROM (SELECT sal.store_id, SUM(price) AS total_sales_per_store
	  FROM sales AS sal
	  GROUP BY sal.store_id) AS x;

-- 3. Find the stores where Total_sales > -- Avg_sales 

-- the problem can be solved the above way but this looks too messy and same query repeated multiple times
-- Subqueries
SELECT * 
FROM (SELECT sal.store_id, SUM(price) AS total_sales_per_store
      FROM sales AS sal
      GROUP BY sal.store_id
) AS total_sales,

(SELECT CAST(AVG(total_sales_per_store) AS INT) AS avg_sales_for_all_stores
    FROM (SELECT sal.store_id, SUM(price) AS total_sales_per_store
          FROM sales AS sal
          GROUP BY sal.store_id ) AS x) AS avg_sales

WHERE total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_stores;

-- so i will use WITH clause 
WITH 
    Total_sales (store_id, total_sales_per_store) AS (
        SELECT sal.store_id, SUM(price) AS total_sales_per_store
        FROM sales AS sal
        GROUP BY sal.store_id
    ),

    Avg_sales (avg_sales_for_all_stores) AS (
        SELECT CAST(AVG(total_sales_per_store) AS INT)
        FROM Total_sales
    )

SELECT *
FROM Total_sales AS ts
JOIN Avg_sales AS av
ON ts.total_sales_per_store > av.avg_sales_for_all_stores;




	   
