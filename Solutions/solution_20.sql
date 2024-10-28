-- Solution 1: Using Group By with CASE for Conditional Aggregation

SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    
    -- Total transaction count and amount for each country and month
    COUNT(*) AS trans_count,
    SUM(amount) AS trans_total_amount,
    
    -- Approved transaction count and total amount
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount

FROM 
    Transactions
GROUP BY 
    DATE_FORMAT(trans_date, '%Y-%m'), country;

-- Explanation:
-- 1. `DATE_FORMAT(trans_date, '%Y-%m')`: Extracts the year and month from the date.
-- 2. `COUNT(*)`: Counts all transactions for the month and country.
-- 3. `SUM(amount)`: Calculates the total transaction amount.
-- 4. `SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END)`: Counts approved transactions.
-- 5. `SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)`: Sums amount of approved transactions.

-- Solution 2: With Common Table Expressions (CTEs) for Stepwise Calculation

WITH MonthlyData AS (
    SELECT 
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        COUNT(*) AS trans_count,
        SUM(amount) AS trans_total_amount
    FROM 
        Transactions
    GROUP BY 
        DATE_FORMAT(trans_date, '%Y-%m'), country
),
ApprovedData AS (
    SELECT 
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
    FROM 
        Transactions
    GROUP BY 
        DATE_FORMAT(trans_date, '%Y-%m'), country
)

-- Join both CTEs for the final output
SELECT 
    m.month,
    m.country,
    m.trans_count,
    a.approved_count,
    m.trans_total_amount,
    a.approved_total_amount
FROM 
    MonthlyData m
JOIN 
    ApprovedData a 
ON 
    m.month = a.month AND m.country = a.country;