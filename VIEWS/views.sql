-- View is a Database Object created over an SQL Query
-- View does not store any data 
-- View is like virtual table 

SELECT * FROM customer_data;
SELECT * FROM product_info;
SELECT * FROM order_details;

-- Fetch the order summary (to be given to client/vendor)
CREATE OR REPLACE VIEW order_summary
AS
SELECT 
    o.order_id, 
    o.order_date, 
    p.prod_name, 
    c.full_name,
    (p.price * o.quantity) - ((p.price * o.quantity) * o.disc_percent::float / 100) AS Final_cost
FROM customer_data AS c 
JOIN order_details AS o  ON o.cust_id = c.cust_id
JOIN product_info AS p   ON p.prod_id = o.prod_id;

-- Rules when using CREATE OR REPLACE
-- Cannot change column name
-- Cannot change column Data Type
-- Cannot change order of column. But we can add a column at the end.

SELECT * FROM order_summary;

-- Why use VIEW? What is the purpose of creating a view? What are its advantages?
-- 1. Security (By hiding the query used to generate the view)
-- 2. To simplify complex SQL queries (Sharing a view is better than sharing complex query)

CREATE ROLE nahid
LOGIN
PASSWORD 'nahid';

GRANT SELECT ON order_summary TO nahid;

-- If I still want to change the structure 
ALTER VIEW order_summary RENAME COLUMN order_date TO ord_date;
ALTER VIEW order_summary RENAME TO order_summary_2;

DROP VIEW order_summary;

SELECT * FROM order_summary_2;

-- Create a view to list expensive products
CREATE OR REPLACE VIEW expensive_products
AS 
SELECT * FROM product_info WHERE price > 1000;

SELECT * FROM expensive_products;

-- Add a new column to the base table
ALTER TABLE product_info ADD COLUMN prod_config VARCHAR(100);

SELECT * FROM product_info;

-- VIEW only saves the SELECT structure, not actual data.
-- It won’t auto-update if table changes. Must replace to reflect updates.

-- Insert new product (Poco X2)
INSERT INTO product_info
VALUES ('P10','Poco X2','Xiomi',10000,null);

-- A VIEW always shows the latest data (from INSERT, UPDATE, DELETE).
-- But it does NOT auto-update when table structure (like new columns) changes.

-- Updatable Views (Not recommended)
-- Views which can be UPDATED/INSERTED/DELETED

-- 1. Views should be created using 1 table/view only

CREATE OR REPLACE VIEW expensive_products
AS 
SELECT * FROM product_info WHERE price > 1000;

SELECT * FROM expensive_products;

-- Update a product through the view
UPDATE expensive_products
SET prod_name = 'Airpods Pro', brand = 'Apple'
WHERE prod_id = 'P10';



SELECT * FROM order_summary_2;

-- more than 1 table can not be uptable 
UPDATE order_summary_2
SET Final_cost = 10
WHERE order_ID = 1;


-- 2.cannot have DISTINCT clause.

-- Views containing DISTINCT are not automatically updatable. 
CREATE OR REPLACE VIEW expensive_products
AS 
SELECT DISTINCT * FROM product_info WHERE price > 1000;

SELECT * FROM expensive_products;


UPDATE expensive_products
SET prod_name = 'Airpods Pro 2', brand = 'Apple'
WHERE prod_id = 'P10';


-- 3.if query contains GROUP BY then cannpot update such views.
-- Views containing GROUP BY are not automatically updatable. 
CREATE VIEW order_count
AS
SELECT order_date, COUNT(1) AS no_of_order
FROM order_details
GROUP BY order_date;


SELECT * FROM order_count;

UPDATE order_count
SET no_of_order = 0
WHERE order_date = '2020-06-01'


-- 4.if query contains WITH clause then cannot update such views.

-- 5.If query contains window functions then cannot update such views.









-- WITH CHECK OPTION

CREATE OR REPLACE VIEW apple_products
AS
SELECT * 
FROM product_info 
WHERE brand = 'Apple'
WITH CHECK OPTION;


INSERT INTO apple_products
VALUES ('P22','S24 Ultra','Samsung','2500',null);


SELECT * FROM apple_products;
SELECT * FROM product_info;