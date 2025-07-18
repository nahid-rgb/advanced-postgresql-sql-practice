-- Select all products
SELECT * FROM product_info;

-- FIRST_VALUE
-- -----------
-- Write query to display the most expensive product under each category (corresponding to each record)
SELECT *, 
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_expn_product
FROM product_info;

-- LAST_VALUE
-- ----------
-- Write query to display the least expensive product under each category (corresponding to each record)
SELECT *, 
       LAST_VALUE(product_name) 
       OVER (PARTITION BY product_category ORDER BY price DESC
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS least_expn_product
FROM product_info;


-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
-- Default Frame (applied silently if we don’t specify one):
-- This is the default when using most window functions (like LAST_VALUE).
-- It only looks from the start of the partition to the current row.  

-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
-- This tells SQL to include all rows in the partition from start to end.
-- This is NOT the default — have to write it.

-- ROWS respects physical position → safe and predictable
-- RANGE groups all rows with same price, even if they come after the current one → tricky


-- FIRST_VALUE() and LAST_VALUE() altogether
-- -----------------------------------------
SELECT *, 
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_expn_product,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC
                                      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS least_expn_prod
FROM product_info;

-- Alternate way to write SQL query using Window functions
-- -------------------------------------------------------
SELECT *,
       FIRST_VALUE(product_name) OVER w AS most_expn_product,
       LAST_VALUE(product_name) OVER w AS LEAST_expn_prod
FROM product_info 
WINDOW w AS (
    PARTITION BY product_category 
    ORDER BY price DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
);


-- NTH_VALUE
-- ---------
-- Write a query to display the second most expensive product under each category.
SELECT *,
       NTH_VALUE(product_name, 2) OVER w AS second_most_expn_product
FROM product_info 
WINDOW w AS (
    PARTITION BY product_category 
    ORDER BY price DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
);


-- NTILE
-- ------
-- Write a query to segregate all the expensive phones, mid range phones, and the cheaper phones.
SELECT product_name,
       CASE 
           WHEN x.buckets = 1 THEN 'Expensive Phones'
           WHEN x.buckets = 2 THEN 'Mid range Phones'
           WHEN x.buckets = 3 THEN 'Cheaper Phones'
       END AS phone_category
FROM (
    SELECT *,
           NTILE(3) OVER (ORDER BY price DESC) AS buckets
    FROM product_info
    WHERE product_category = 'Phone'
) AS x;


-- CUME_DIST (Cumulative Distribution)
-- ------------------------------------
-- This function returns a value between 0 and 1 that shows 
-- how far along a row is in the dataset (based on ordering).

-- Formula:
--   CUME_DIST = Number of rows with value <= current row / Total rows in the partition

-- Query to fetch all products which are constituting the first 30%
-- of the data in products table based on price.
SELECT product_name, 
       (cum_dist_percentage || '%') AS cum_dist_percentage
FROM (
    SELECT *,
           CUME_DIST() OVER (ORDER BY price DESC) AS cum_dist,
           ROUND(CUME_DIST() OVER (ORDER BY price DESC)::numeric * 100, 2) AS cum_dist_percentage
    FROM product_info
) AS x 
WHERE x.cum_dist_percentage <= 30;


-- PERCENT_RANK() -> shows the relative rank of each row as a percentage.
-- -------------- 
-- PERCENT_RANK = (Rank of current row - 1) / (Total rows - 1)
-- Always starts at 0.0 and ends at 1.0

-- Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all products
SELECT product_name, per_rank
FROM (
    SELECT *,
           PERCENT_RANK() OVER (ORDER BY price ASC) AS percentage_rank,
           ROUND(PERCENT_RANK() OVER (ORDER BY price ASC)::numeric * 100, 2) AS per_rank 
    FROM product_info
) AS x
WHERE x.product_name = 'Galaxy Z Fold 3';
