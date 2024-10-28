-- Solution to find the percentage of users registered in each contest

-- Method 1: Using Basic Aggregate Functions
SELECT 
    r.contest_id,
    ROUND((COUNT(DISTINCT r.user_id) / (SELECT COUNT(*) FROM Users)) * 100, 2) AS percentage
FROM 
    Register r
GROUP BY 
    r.contest_id
ORDER BY 
    percentage DESC, r.contest_id ASC;

-- Explanation:
-- 1. COUNT(DISTINCT r.user_id) gives the number of unique users registered in each contest.
-- 2. (SELECT COUNT(*) FROM Users) gives the total number of users.
-- 3. We divide the unique count by the total user count, multiply by 100, and round to two decimal places.
-- 4. Results are ordered by `percentage` (descending) and then by `contest_id` (ascending) for ties.

-- Method 2: Using Common Table Expressions (CTEs)
WITH UserCount AS (
    SELECT COUNT(*) AS total_users FROM Users
),
ContestRegistrations AS (
    SELECT 
        contest_id,
        COUNT(DISTINCT user_id) AS registered_users
    FROM 
        Register
    GROUP BY 
        contest_id
)
SELECT 
    c.contest_id,
    ROUND((c.registered_users / u.total_users) * 100, 2) AS percentage
FROM 
    ContestRegistrations c
CROSS JOIN 
    UserCount u
ORDER BY 
    percentage DESC, c.contest_id ASC;

-- Explanation:
-- 1. The CTE `UserCount` stores the total user count.
-- 2. The CTE `ContestRegistrations` calculates the unique registered users per contest.
-- 3. The main query divides registered users by the total users, rounding to two decimals.
-- 4. Results are ordered by `percentage` (descending) and then by `contest_id` (ascending).
