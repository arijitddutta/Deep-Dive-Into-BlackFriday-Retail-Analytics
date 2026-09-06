-- migrate + cast 
INSERT INTO black_friday_data
SELECT
    User_ID, Product_ID, Gender, Age, Occupation, City_Category,
    Stay_In_Current_City_Years, Marital_Status, Product_Category_1,
    CAST(Product_Category_2 AS UNSIGNED),
    CAST(Product_Category_3 AS UNSIGNED),
    Purchase
FROM black_friday_staging;