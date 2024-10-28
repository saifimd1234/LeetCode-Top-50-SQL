-- Solution 1: Using Aggregates and Subqueries for Clarity

-- Calculate quality and poor_query_percentage for each query_name
SELECT 
    query_name,
    
    -- Calculate query quality as the average of (rating / position)
    ROUND(AVG(rating / position), 2) AS quality,
    
    -- Calculate poor query percentage as the ratio of queries with rating < 3
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
    
FROM 
    Queries
GROUP BY 
    query_name;

-- Explanation:
-- 1. `AVG(rating / position)`: Computes the average ratio for each `query_name`.
-- 2. `SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)`: Counts rows with a poor rating.
-- 3. `COUNT(*)`: Gives the total number of rows per `query_name`.
-- 4. The percentage is calculated by `(poor count / total count) * 100` and rounded to two decimals.

-- Solution 2: Using Common Table Expressions (CTE) for Improved Readability

WITH Quality_CTE AS (
    SELECT
        query_name,
        ROUND(AVG(rating / position), 2) AS quality
    FROM
        Queries
    GROUP BY
        query_name
),
PoorQuery_CTE AS (
    SELECT
        query_name,
        ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
    FROM
        Queries
    GROUP BY
        query_name
)
-- Final result combining both CTEs
SELECT
    q.query_name,
    q.quality,
    p.poor_query_percentage
FROM
    Quality_CTE q
JOIN
    PoorQuery_CTE p ON q.query_name = p.query_name;

-- Explanation:
-- - `Quality_CTE`: Calculates the quality score for each query_name.
-- - `PoorQuery_CTE`: Calculates the poor query percentage for each query_name.
-- - The final selection joins both CTEs by `query_name` to produce the required result.

-- Solution 3: Simple GROUP BY approach
SELECT
    query_name,
    ROUND(AVG(rating/position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating<3 THEN 1 ELSE 0 END)*100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- Alternatively:
-- U can use 'IF' instead of 'CASE WHEN'
SELECT
    query_name,
    ROUND(AVG(rating/position), 2) AS quality,
    ROUND(AVG(IF(rating < 3, 1, 0)*100), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;