-- =========================================
-- RETAIL PROFITABILITY ANALYSIS
-- Superstore Dataset Cleaning + Analysis
-- =========================================

-- 1. CLEANING: Create structured table
DROP TABLE IF EXISTS superstore_clean;

CREATE TABLE superstore_clean AS
SELECT
    `Order ID`      AS order_id,
    `Order Date`    AS order_date,
    `Ship Date`     AS ship_date,
    `Ship Mode`     AS ship_mode,
    `Customer ID`   AS customer_id,
    `Customer Name` AS customer_name,
    `Segment`       AS segment,
    `Country`       AS country,
    `City`          AS city,
    `State`         AS state,
    `Postal Code`   AS postal_code,
    `Region`        AS region,
    `Product ID`    AS product_id,
    `Category`      AS category,
    `Sub-Category`  AS sub_category,
    `Product Name`  AS product_name,
    CAST(`Sales` AS REAL)    AS sales,
    CAST(`Quantity` AS INT)   AS quantity,
    CAST(`Discount` AS REAL)  AS discount,
    CAST(`Profit` AS REAL)    AS profit
FROM superstore;

-- =========================================
-- 2. CATEGORY PERFORMANCE
-- =========================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales),3) AS margin
FROM superstore_clean
GROUP BY category
ORDER BY margin DESC;

-- =========================================
-- 3. LOSS-MAKING PRODUCTS
-- =========================================

SELECT
    product_name,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY product_name
ORDER BY profit ASC
LIMIT 10;

-- =========================================
-- 4. FURNITURE DISCOUNT IMPACT
-- =========================================

SELECT
    category,
    discount,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY category, discount
ORDER BY category, discount;

-- =========================================
-- 5. SUB-CATEGORY PROFITABILITY (FOCUS)

SELECT
    sub_category,
    discount,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
WHERE category = 'Furniture'
GROUP BY sub_category, discount
ORDER BY profit ASC;

-- =========================================
-- 6. DAILY PERFORMANCE TREND

SELECT
    order_date,
    ROUND(SUM(sales),2) AS daily_sales,
    ROUND(SUM(profit),2) AS daily_profit
FROM superstore_clean
GROUP BY order_date
ORDER BY order_date;

-- =========================================
-- 7. TOP PROFITABLE PRODUCTS

SELECT
    product_name,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY product_name
ORDER BY profit DESC
LIMIT 10;