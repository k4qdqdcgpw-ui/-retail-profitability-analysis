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



### Discount Impact Analysis

To understand whether discounting was driving low profitability, I grouped orders into discount bands and measured revenue, profit, and margin by category.

#### Key Findings

- All categories were strongly profitable at full price:

  - Technology: 33.96% margin

  - Office Supplies: 29.52% margin

  - Furniture: 22.71% margin

- Margins declined sharply as discount levels increased

- Furniture dropped from a 22.7% margin at 0% discount to -18.3% at medium discounts and -70.9% at high discounts

- Office Supplies and Technology showed the same pattern, indicating that profit leakage was not limited to Furniture

#### Business Insight

The company’s core issue is not weak demand, but excessive discounting. Full-price sales are highly profitable, while medium and high discount levels systematically destroy margin across the business.

