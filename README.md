# Retail Profit Leakage Analysis (SQL)

## Executive Summary

Retail businesses often grow revenue while profit declines due to pricing inefficiencies and excessive discounting.

This project analyzes a retail transaction dataset to identify the drivers of **profit leakage**, with a focus on category performance, discount behavior, and structurally unprofitable products.

### Key Findings
- Furniture has the lowest profitability (~2.5% margin) compared to Technology and Office Supplies (~17%)
- Discounts above ~30% consistently eliminate profitability
- Tables and Bookcases are the primary loss-driving sub-categories
- Profit issues are driven by pricing strategy, not demand or sales volume

---

## Business Problem

Retail companies often face the challenge of strong sales but weak profitability.

This analysis investigates:

- Why Furniture significantly underperforms other categories
- Which products and sub-categories generate persistent losses
- How discount levels affect profitability
- What pricing adjustments can improve overall margins

---

## Dataset

- Source: Superstore-style retail transaction dataset
- Size: ~9,000+ rows
- Key Fields:
  - Order ID, Order Date
  - Category, Sub-Category, Product Name
  - Sales, Quantity, Discount, Profit
  - Customer and geographic attributes

---

## Tools Used

- SQL (MySQL Workbench / SQLite-compatible syntax)
- Data cleaning and transformation via SQL
- Aggregation-based exploratory analysis
- Profitability segmentation and diagnostic analysis

---

## Data Preparation

The raw dataset was transformed into an analysis-ready table for querying.

### Steps:
- Standardized column names
- Converted numeric fields (Sales, Profit, Discount, Quantity)
- Created structured table: `superstore_clean`

### Example:

```sql
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
