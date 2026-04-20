-- =========================================================
-- UK E-commerce Cancellation Loss Analysis
-- =========================================================
-- Objective:
-- Identify products contributing most to cancellation-related revenue loss
-- in the UK market.

-- =========================================================
-- Step 1: Filter UK cancelled transactions
-- =========================================================

SELECT *
FROM ecommerce
WHERE Country = 'United Kingdom'
  AND InvoiceNo LIKE 'C%';


-- =========================================================
-- Step 2: Exclude non-product records
-- =========================================================

SELECT *
FROM ecommerce
WHERE Country = 'United Kingdom'
  AND InvoiceNo LIKE 'C%'
  AND LOWER(Description) NOT LIKE '%manual%'
  AND LOWER(Description) NOT LIKE '%amazon%'
  AND LOWER(Description) NOT LIKE '%postage%'
  AND LOWER(Description) NOT LIKE '%bank charges%'
  AND LOWER(Description) NOT LIKE '%cruk%'
  AND LOWER(Description) NOT LIKE '%discount%'
  AND LOWER(Description) NOT LIKE '%samples%';


-- =========================================================
-- Step 3: Calculate product-level cancellation loss
-- =========================================================

SELECT 
    Description,
    SUM(Quantity * UnitPrice) AS total_loss
FROM ecommerce
WHERE Country = 'United Kingdom'
  AND InvoiceNo LIKE 'C%'
  AND LOWER(Description) NOT LIKE '%manual%'
  AND LOWER(Description) NOT LIKE '%amazon%'
  AND LOWER(Description) NOT LIKE '%postage%'
  AND LOWER(Description) NOT LIKE '%bank charges%'
  AND LOWER(Description) NOT LIKE '%cruk%'
  AND LOWER(Description) NOT LIKE '%discount%'
  AND LOWER(Description) NOT LIKE '%samples%'
GROUP BY Description
ORDER BY total_loss ASC;


-- =========================================================
-- Step 4: Focus on significant loss cases
-- (Filter out small noise transactions)
-- =========================================================

SELECT 
    Description,
    SUM(Quantity * UnitPrice) AS total_loss
FROM ecommerce
WHERE Country = 'United Kingdom'
  AND InvoiceNo LIKE 'C%'
  AND LOWER(Description) NOT LIKE '%manual%'
  AND LOWER(Description) NOT LIKE '%amazon%'
  AND LOWER(Description) NOT LIKE '%postage%'
  AND LOWER(Description) NOT LIKE '%bank charges%'
  AND LOWER(Description) NOT LIKE '%cruk%'
  AND LOWER(Description) NOT LIKE '%discount%'
  AND LOWER(Description) NOT LIKE '%samples%'
GROUP BY Description
HAVING SUM(Quantity * UnitPrice) > -10000
ORDER BY total_loss ASC
LIMIT 10;