-- sanity check 
SELECT COUNT(*) FROM black_friday_data;

-- Data loaded perfectly , and we will check for any redundency 

SELECT 
    User_ID,
    Product_ID,
    COUNT(*) AS record_count
FROM black_friday_data
GROUP BY 
    User_ID,
    Product_ID
HAVING COUNT(*) > 1;
-- passed empty records are none 

-- Data validation (like we did in excel)
SELECT COUNT(DISTINCT User_ID) AS unique_customers -- unique cust check 
FROM black_friday_data;

SELECT COUNT(DISTINCT Product_ID) AS unique_products -- unique product check 
FROM black_friday_data;

-- Null CHECK 

SELECT
    SUM(User_ID IS NULL) AS missing_user_id,
    SUM(Product_ID IS NULL) AS missing_product_id,
    SUM(Purchase IS NULL) AS missing_purchase,
    SUM(Product_Category_2 IS NULL) AS missing_category_2,
    SUM(Product_Category_3 IS NULL) AS missing_category_3
FROM black_friday_data;

    --  Lets check the Range 
    SELECT
    MIN(Purchase) AS minimum_purchase,
    MAX(Purchase) AS maximum_purchase
FROM black_friday_data;

-- Check Schema 

DESCRIBE black_friday_data;

-- constarint chk
SHOW KEYS
FROM black_friday_data
WHERE Key_name = 'PRIMARY';	

-- Data Validation Complete 