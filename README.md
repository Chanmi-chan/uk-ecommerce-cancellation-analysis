# UK E-commerce Cancellation Loss Analysis

## Project Overview
This project analyses cancelled transactions in a UK e-commerce dataset to identify which products and categories contributed most to negative revenue.

Rather than simply excluding cancelled orders from sales analysis, this project isolates and examines cancellation records separately to better understand loss patterns and potential business risks.

---

## Business Question
Which cancelled products and product categories contributed most to negative revenue in the UK market?

---

## Dataset Scope
The analysis focused on:
- UK transactions only
- Cancelled orders only (`InvoiceNo` beginning with `C`)
- Product-level transactions only
- Excluding non-product records such as postage, discounts, manual adjustments, Amazon fees, and bank charges

---

## Tools Used
- **Excel**: initial cleaning and keyword-based category mapping
- **SQL (MySQL)**: filtering, aggregation, and loss calculation
- **Tableau**: dashboard visualisation

---

## Data Cleaning and Preparation

### 1. UK market filtering
Only transactions from the United Kingdom were included in the analysis.

### 2. Cancellation identification
Cancelled orders were identified using invoice numbers beginning with `C`.

- Total UK transactions: **541,494**
- Cancelled UK transactions: **7,856**
- Cancellation share: **1.45%**

Because cancellation volume was relatively low compared to the full dataset, the main revenue analysis excluded these records.  
However, cancelled orders were analysed separately to investigate loss concentration and cancellation patterns.

### 3. Non-product exclusions
The following non-product or irrelevant records were excluded:
- manual
- amazon
- postage
- bank charges
- cruk
- discount
- samples

### 4. Category mapping
Products were grouped into broader business categories using keyword-based mapping in Excel.

Examples:
- `BAG`, `SHOPPER` → Bags & Storage
- `MUG`, `JAR`, `CAKE` → Kitchen & Dining
- `CANDLE`, `FRAME`, `MIRROR` → Home Decor
- `PARTY`, `BUNTING`, `CHRISTMAS` → Party & Seasonal

---

## Analysis Process
The analysis followed these steps:

1. Filter UK transactions
2. Isolate cancelled records using `InvoiceNo LIKE 'C%'`
3. Exclude non-product descriptions
4. Calculate cancellation loss using `Quantity * UnitPrice`
5. Rank products by total negative revenue
6. Aggregate losses by category
7. Examine highly concentrated cancellation cases
8. Interpret bulk cancellation patterns and consumer product behaviour

---

## Key Findings

### 1. Kitchen & Dining generated the highest cancellation loss
Among all mapped categories, **Kitchen & Dining** contributed the largest share of total negative revenue.

This suggests that cancellation-related losses were not evenly distributed across the business, but were concentrated in a small number of product groups.

### 2. A small number of products drove the majority of losses
The loss distribution was highly skewed.

A small number of cancelled products accounted for a disproportionately large share of total negative revenue, showing a strong concentration effect rather than a broad-based loss pattern.

### 3. Bulk cancellations had a major impact on total loss
Some products showed extremely large cancellation quantities in a single invoice.

For example, one cancellation record for **PAPER CRAFT , LITTLE BIRDIE** involved a quantity of **-80,995**, generating exceptionally high negative revenue.

This pattern suggests that some losses were driven not by normal consumer returns, but by large bulk cancellations, possibly related to B2B or wholesale transactions.

### 4. Decorative and gift-oriented items showed frequent cancellation patterns
Many cancelled products fell into non-essential categories such as:
- home decor
- gift items
- seasonal or party-related products
- decorative kitchen items

These products are more likely to be associated with:
- impulse purchases
- event-based demand
- flexible discretionary spending

This suggests that cancellation behaviour may differ by product type, not just by sales volume.

---

## Business Interpretation
The findings suggest that cancellation losses in the UK market were driven by two distinct patterns:

1. **Large bulk cancellations**, which created unusually high revenue loss and may reflect B2B or wholesale-related order risk  
2. **Non-essential consumer products**, especially decorative or gift-oriented items, which may be more vulnerable to impulse purchase cancellations

This means cancellation loss is not a general problem across all products.  
Instead, it is concentrated in specific transaction types and product categories.

---

## Dashboard
You can view the Tableau dashboard here:

[[Tableau Public Dashboard](PASTE_YOUR_TABLEAU_PUBLIC_LINK_HERE)
](https://public.tableau.com/views/LondonEcommerce/ProductLossAnalysisDashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
---

## Project Files
- `cancellation_analysis.data.sql` → SQL queries used for filtering and aggregation
- `data/sample_cancellation_data.csv` → sample cleaned data used for analysis
- `tableau_dashboard.png` → dashboard preview image



