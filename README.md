# -retail-profitability-analysis

Retail Profitability Analysis (SQL)

Overview

This project analyzes retail transaction data to identify key drivers of profitability and loss across product categories, sub-categories, and discount levels. The goal is to understand why certain segments (especially Furniture) underperform despite strong sales volume, and to generate actionable business recommendations.

The analysis was conducted using SQL in MySQL Workbench on a cleaned version of a Superstore-style dataset.

⸻

Business Problem

Retail companies often experience strong sales growth but weak profitability due to pricing, discounting, and product mix issues.

This project answers:

* Why is the Furniture category significantly less profitable than other categories?
* Which products and sub-categories generate losses?
* How do discounts impact profit behavior?
* What pricing or product strategy changes could improve margins?

⸻

Dataset

* Source: Superstore transactional dataset (CSV import)
* Size: ~9,000+ rows
* Key fields:
    * Order ID, Order Date
    * Category, Sub-Category, Product Name
    * Sales, Quantity, Discount, Profit
    * Customer and geographic attributes

⸻

Tools Used

* SQL (MySQL Workbench / SQLite compatible syntax)
* Data cleaning via SQL transformation
* Aggregation & analytical queries

⸻

Data Preparation

Key cleaning steps included:

* Handling CSV import encoding issues
* Standardizing column names
* Casting numeric fields (Sales, Profit, Discount, Quantity)
* Creating a structured analytical table: superstore_clean

Example transformation:

CREATE TABLE superstore_clean AS
SELECT
    `Order ID` AS order_id,
    `Order Date` AS order_date,
    `Category` AS category,
    `Sub-Category` AS sub_category,
    `Product Name` AS product_name,
    CAST(`Sales` AS REAL) AS sales,
    CAST(`Profit` AS REAL) AS profit,
    CAST(`Discount` AS REAL) AS discount
FROM superstore;

Key Analyses

1. Profitability by Category

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),3) AS margin
FROM superstore_clean
GROUP BY category
ORDER BY margin DESC;

Result Summary

* Technology: Highest margin (~17%)
* Office Supplies: Stable mid-range margin (~17%)
* Furniture: Very low margin (~2.5%)

2. Loss-Making Products

SELECT
    product_name,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM superstore_clean
GROUP BY product_name
ORDER BY profit ASC
LIMIT 10;

Insight

Losses are concentrated in:

* Tables
* Bookcases
* Certain large office equipment and furniture items

3. Impact of Discount on Profit (Furniture)

SELECT
    category,
    discount,
    COUNT(*) AS orders,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM superstore_clean
GROUP BY category, discount
ORDER BY category, discount;

Key Finding

* Profit drops sharply after ~30% discount
* Discounts above 40% consistently generate negative profit
* Furniture is the most sensitive category to discounting

4. Sub-Category Profitability (Furniture Focus)

Key Insights

* Furniture is structurally low-margin due to discount dependency
* Profitability collapses when discount exceeds ~30%
* Losses are concentrated in Tables and Bookcases
* Technology products (e.g., copiers, printers) are high-margin and stable

Business Recommendations

* Reduce aggressive discounting on Furniture (cap ~20–25%)
* Reprice Tables and Bookcases or revise supplier cost structure
* Shift promotional focus toward high-margin Technology products
* Introduce margin-based discount rules instead of flat discounting
Project Outcome

This analysis demonstrates:

* SQL data cleaning and transformation
* Aggregation and exploratory data analysis
* Business insight generation from raw transactional data
* Ability to translate data into actionable strategy

  

