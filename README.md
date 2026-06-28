Retail Profit Leakage Analysis (SQL)

Dashboard can be viewed here:
https://public.tableau.com/app/profile/mohamed.eltohami/viz/Superstore_17826712116790/ProfitOverview?publish=yes
⸻

Executive Summary

Retail companies often experience strong revenue growth while profitability declines due to pricing inefficiencies and excessive discounting.

This project analyzes a retail transaction dataset to identify key drivers of profit leakage, with a focus on category performance, discount behavior, and structurally unprofitable products.

The analysis reveals that profitability issues are driven primarily by discounting strategy rather than demand or sales volume.

⸻

Business Problem

Retail organizations often face a disconnect between revenue growth and profitability.

This analysis addresses:

* Why Furniture significantly underperforms other categories
* Which sub-categories consistently generate losses
* How discount levels impact profitability across categories
* What pricing behaviors lead to margin erosion

⸻

Dataset

* Source: Superstore-style retail transaction data
* Size: ~9,000+ rows

Key Fields:

Order ID, Order Date
Category, Sub-Category, Product Name
Sales, Quantity, Discount, Profit
Customer and geographic attributes

⸻

Tools Used

* SQL (MySQL / SQLite-compatible syntax)
* Data cleaning and transformation in SQL
* Aggregation-based analysis (GROUP BY, CTEs)
* Profitability segmentation

⸻

Data Preparation

The raw dataset was transformed into an analysis-ready structure.

Steps:

* Standardized column formatting
* Converted numeric fields (Sales, Profit, Discount)
* Created clean analytical table (superstore_clean)

⸻

Key Findings

* Furniture has the lowest profitability (~2.5% margin) compared to Technology and Office Supplies (~17%)
* Tables and Bookcases are the primary loss-driving sub-categories
* Discounts above ~30% consistently eliminate profitability
* Profitability issues are structural and concentrated in specific product groups rather than overall demand

⸻

Discount Impact Analysis

Orders were grouped into discount bands to evaluate profitability behavior across pricing levels.

Key Results:

* At 0% discount, all categories are strongly profitable:
    * Technology: ~34% margin
    * Office Supplies: ~30% margin
    * Furniture: ~23% margin
* Profitability declines sharply as discounts increase across all categories
* Furniture is most sensitive to discounting:
    * ~23% → -18% → -70% margin (as discount increases)
* Technology and Office Supplies follow the same pattern, but with less severity

⸻

Business Insight

The primary driver of profit leakage is not demand weakness, but pricing strategy.

While full-price transactions are highly profitable across all categories, increasing discount levels systematically erode margins and create structural losses—especially in Furniture.

This suggests that optimizing discount strategy would have a higher impact on profitability than increasing sales volume.
