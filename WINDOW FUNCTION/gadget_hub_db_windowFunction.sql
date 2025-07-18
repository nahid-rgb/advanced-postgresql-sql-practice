-- Drop the table if it already exists
DROP TABLE IF EXISTS product_info;

-- Create the product_info table using SERIAL for auto-incrementing
CREATE TABLE product_info (
    product_id SERIAL PRIMARY KEY,
    product_category VARCHAR(255),
    brand VARCHAR(255),
    product_name VARCHAR(255),
    price INT 
);

-- Insert 50 product rows
INSERT INTO product_info (product_category, brand, product_name, price) VALUES
-- Phones
('Phone', 'Apple', 'iPhone 12 Pro Max', 165000),
('Phone', 'Apple', 'iPhone 12 Pro', 145000),
('Phone', 'Apple', 'iPhone 12', 120000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 220000),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 140000),
('Phone', 'Samsung', 'Galaxy Note 20', 130000),
('Phone', 'Samsung', 'Galaxy S21', 125000),
('Phone', 'OnePlus', 'OnePlus Nord', 45000),
('Phone', 'Xiaomi', 'Redmi Note 12', 28000),
('Phone', 'Realme', 'Realme 11 Pro+', 39000),

-- Laptops
('Laptop', 'Apple', 'MacBook Pro 16"', 280000),
('Laptop', 'Apple', 'MacBook Air M1', 135000),
('Laptop', 'Dell', 'XPS 13', 155000),
('Laptop', 'Dell', 'Inspiron 15', 85000),
('Laptop', 'HP', 'Spectre x360', 160000),
('Laptop', 'HP', 'Pavilion 14', 70000),
('Laptop', 'Asus', 'ROG Strix G15', 170000),
('Laptop', 'Asus', 'ZenBook 14', 110000),
('Laptop', 'Lenovo', 'ThinkPad X1 Carbon', 190000),
('Laptop', 'Acer', 'Aspire 5', 60000),

-- Earphones
('Earphone', 'Apple', 'AirPods Pro', 28000),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 21000),
('Earphone', 'Sony', 'WF-1000XM4', 25000),
('Earphone', 'OnePlus', 'Buds Z2', 8000),
('Earphone', 'Realme', 'Buds Q2', 2500),
('Earphone', 'JBL', 'Tune 230NC', 6500),
('Earphone', 'Boat', 'Airdopes 441', 3000),
('Earphone', 'Skullcandy', 'Sesh Evo', 4500),
('Earphone', 'Anker', 'Soundcore Liberty 2', 7000),
('Earphone', 'Oppo', 'Enco Air 2', 5000),

-- Headphones
('Headphone', 'Sony', 'WH-1000XM5', 42000),
('Headphone', 'Bose', 'QuietComfort 45', 40000),
('Headphone', 'JBL', 'Live 660NC', 18000),
('Headphone', 'Sennheiser', 'HD 450BT', 15000),
('Headphone', 'Beats', 'Solo Pro', 22000),
('Headphone', 'Philips', 'TAPH805', 14000),
('Headphone', 'AKG', 'N700NC', 16000),
('Headphone', 'Marshall', 'Major IV', 13000),
('Headphone', 'Boat', 'Rockerz 550', 4000),
('Headphone', 'Zebronics', 'Zeb-Rush', 3000),

-- Smartwatches
('Smartwatch', 'Apple', 'Watch Series 8', 55000),
('Smartwatch', 'Samsung', 'Galaxy Watch 5', 45000),
('Smartwatch', 'Fitbit', 'Versa 4', 25000),
('Smartwatch', 'Garmin', 'Venu 2 Plus', 52000),
('Smartwatch', 'Realme', 'Watch 3 Pro', 8000),
('Smartwatch', 'Noise', 'ColorFit Ultra 2', 6000),
('Smartwatch', 'Amazfit', 'GTS 4', 18000),
('Smartwatch', 'Boat', 'Xtend', 4500),
('Smartwatch', 'Huawei', 'Watch GT 3', 27000),
('Smartwatch', 'Fossil', 'Gen 6', 30000);
