# 📘 Advanced PostgreSQL – SQL Concepts & Practice

This project contains a comprehensive set of **PostgreSQL SQL queries and examples** that demonstrate advanced SQL topics using practical scenarios. Each topic folder contains both the **query scripts** and the **sample database** used to execute them.

---

## ✅ Topics Covered

This repository demonstrates advanced SQL concepts through real-life inspired use cases:

### 1. Common Table Expressions (CTE)
* Writing modular and readable SQL using `WITH` clause.
* Avoiding repetition of subqueries.
* Example: Comparing store sales against the average using CTEs.
* Folder: `CTE/`
  * Sample database: `office_cte_db`
  * SQL queries: `cte`

### 2. JOINS – All Types
* `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`, `NATURAL JOIN`, and `SELF JOIN`.
* Joining across employee, department, manager, and project datasets.
* Folder: `JOINS/`
  * Sample database: `Office_Database_db`
  * SQL queries: `joins`

### 3. Subqueries – All Types
* Scalar subqueries, correlated subqueries, nested subqueries.
* Subqueries in `SELECT`, `WHERE`, `HAVING`, `INSERT`, `UPDATE`, and `DELETE`.
* Folder: `SUBQUERIES/`
  * Sample database: `company_operations_db`
  * SQL queries: `subquery`

### 4. Views
* Creating and using `VIEW` to simplify and secure SQL.
* Updatable views and their limitations (`DISTINCT`, `GROUP BY`, `WINDOW FUNCTIONS`, etc.).
* Folder: `VIEWS/`
  * Sample database: `retail_system_db`
  * SQL queries: `views`
  * View examples (e.g., `view_user`, `order_summary`, `expensive_products`, etc.)

### 5. Window Functions
* Ranking functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`.
* Analytical functions: `LAG()`, `LEAD()`, `FIRST_VALUE()`, `LAST_VALUE()`, `NTH_VALUE()`, `CUME_DIST()`, `PERCENT_RANK()`, `NTILE()`.
* Folder: `WINDOW FUNCTION/`
  * Sample databases:
    * `employee_db_windowFunction` → used for employee salary analysis
    * `gadget_hub_db_windowFunction` → used for product pricing analysis
  * SQL queries:
    * `windowFunction_employee_1` → employee-based window functions
    * `windowFunction_gadget_hub_2` → gadget pricing and distribution analysis

---

## 📁 Sample Datasets Used

Each folder contains both queries and a sample database to run those queries:

* `office_cte_db` → Used in CTE examples for store sales and average calculations.
* `Office_Database_db` → Used in JOIN examples across employee, department, manager, and project tables.
* `company_operations_db` → Used in subquery-based operations (scalar, correlated, nested).
* `retail_system_db` → Used for view creation and analysis involving products, customers, and orders.
* `employee_db_windowFunction` → Used to analyze employee salaries with window functions.
* `gadget_hub_db_windowFunction` → Used to analyze product prices and ranks with window functions.

---

## 📌 Key Highlights

* Realistic business cases across departments, products, and sales.
* Rewriting subqueries using CTEs for better clarity and reuse.
* Window functions used for analytical breakdowns.
* Secure and simplified reporting using views with access roles.

---

## 📂 Folder Structure

📁 advanced_postgresql_sql/
├── CTE/
│ ├── office_cte_db.sql
│ └── cte.sql
│
├── JOINS/
│ ├── office_Database_db.sql
│ └── joins.sql
│
├── SUBQUERIES/
│ ├── company_operations_db.sql
│ └── subquery.sql
│
├── VIEWS/
│ ├── retail_system_db.sql
│ ├── view_user.sql
│ └── views.sql
│
├── WINDOW FUNCTION/
│ ├── employee_db_windowFunction.sql
│ ├── gadget_hub_db_windowFunction.sql
│ ├── windowFunction_employee_1.sql
│ └── windowFunction_gadget_hub_2.sql
