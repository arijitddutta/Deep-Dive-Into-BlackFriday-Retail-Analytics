-- Creating Actual Sales Table 
USE black_friday_db;
CREATE TABLE 
black_friday_data (
    User_ID INT NOT NULL,
    Product_ID VARCHAR(10)NOT NULL,
    Gender CHAR(1) NOT NULL,
    Age  VARCHAR(5)  NOT NULL,
    Occupation INT NOT NULL,
    City_Category CHAR(1)NOT NULL,
    Stay_In_Current_City_Years VARCHAR(2) NOT NULL,
    Marital_Status TINYINT    NOT NULL,
    Product_Category_1 TINYINT UNSIGNED   NOT NULL,
    Product_Category_2 INT UNSIGNED   NULL,
    Product_Category_3 INT UNSIGNED   NULL,
    Purchase INT UNSIGNED  NOT NULL,
    PRIMARY KEY (User_ID, Product_ID),
    CONSTRAINT chk_purchase_positive CHECK (Purchase > 0));