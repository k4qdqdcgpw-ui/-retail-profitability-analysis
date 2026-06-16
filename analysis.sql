-- =========================================
-- RETAIL PROFIT LEAKAGE ANALYSIS
-- Superstore Dataset
-- =========================================

-- =========================================
-- 1. DATA PREPARATION
-- Business Question: How do we structure raw data for analysis?
-- =========================================

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

-- Insight: Data standardized for profitability and margin analysis


-- =========================================
-- 2. CATEGORY PERFORMANCE OVERVIEW
-- Business Question: Which categories drive profit vs revenue?
-- =========================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales),3) AS margin
FROM superstore_clean
GROUP BY category
ORDER BY margin DESC;

-- Insight:
-- Technology has strongest margins
-- Furniture significantly underperforms (~2.5% margin)


-- =========================================
-- 3. LOSS-MAKING PRODUCTS IDENTIFICATION
-- Business Question: Which products consistently destroy profit?
-- =========================================

SELECT
    product_name,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY product_name
ORDER BY profit ASC
LIMIT 10;

-- Insight:
-- Losses concentrated in Tables, Bookcases, and heavy furniture items


-- =========================================
-- 4. DISCOUNT IMPACT ANALYSIS
-- Business Question: How does discounting affect profitability?
-- =========================================

SELECT
    category,
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.2 THEN 'Low (0–20%)'
        WHEN discount <= 0.4 THEN 'Medium (20–40%)'
        ELSE 'High (40%+)'
    END AS discount_band,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY category, discount_band
ORDER BY category, discount_band;

-- Insight:
-- Profitability sharply declines beyond 30% discount threshold
-- High discounts consistently lead to negative profit


-- =========================================
-- 5. FURNITURE PROFITABILITY DEEP DIVE
-- Business Question: Why is Furniture the weakest category?
-- =========================================

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

-- Insight:
-- Tables and Bookcases are structurally loss-making
-- Profit collapses as discount increases


-- =========================================
-- 6. DAILY PERFORMANCE TRENDS
-- Business Question: Are there time-based profitability patterns?
-- =========================================

SELECT
    order_date,
    ROUND(SUM(sales),2) AS daily_sales,
    ROUND(SUM(profit),2) AS daily_profit
FROM superstore_clean
GROUP BY order_date
ORDER BY order_date;

-- Insight:
-- Profit volatility suggests inconsistent pricing and discounting behavior


-- =========================================
-- 7. TOP PROFITABLE PRODUCTS
-- Business Question: What products generate the most profit?
-- =========================================

SELECT
    product_name,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM superstore_clean
GROUP BY product_name
ORDER BY profit DESC
LIMIT 10;

-- Insight:
-- Technology products dominate top profitability rankings


-- =========================================
-- 8. FINAL CATEGORY SUMMARY SNAPSHOT
-- Business Question: What is the overall profitability structure?
-- =========================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),3) AS margin,
    COUNT(*) AS total_orders
FROM superstore_clean
GROUP BY category
ORDER BY margin ASC;

-- Insight:
-- Clear structural issue: Furniture drags overall profitability downSELECT
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
