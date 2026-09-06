
-- Black Friday Sales Analysis — Dimension-Like Views

USE black_friday_db;

-- ----------------------------------------------------------------------------
-- VIEW 1: customer_info — one row per customer, demographic profile
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW customer_info AS
SELECT DISTINCT
    User_ID,
    Gender,
    Age,
    Occupation,
    City_Category,
    Stay_In_Current_City_Years,
    Marital_Status
FROM black_friday_data;

-- ----------------------------------------------------------------------------
-- VIEW 2: product_info — one row per product, category profile
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW product_info AS
SELECT DISTINCT
    Product_ID,
    Product_Category_1,
    Product_Category_2,
    Product_Category_3
FROM black_friday_data;

-- ----------------------------------------------------------------------------
-- VIEW 3: transaction_data — one row per transaction (the fact grain)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW transaction_data AS
SELECT
    User_ID,
    Product_ID,
    Purchase
FROM black_friday_data;

-- ----------------------------------------------------------------------------
-- Sanity checks — run after creating the views above
-- ----------------------------------------------------------------------------
SELECT COUNT(*) AS customer_rows FROM customer_info;    
SELECT COUNT(*) AS product_rows  FROM product_info;     
SELECT COUNT(*) AS txn_rows      FROM transaction_data; 
