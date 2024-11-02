-- Solution 1: Using UNION and GROUP BY
-- This approach counts unique friendships for each user by combining requester and accepter IDs.

SELECT 
    id,
    COUNT(*) AS num
FROM
    (SELECT requester_id AS id FROM RequestAccepted
     UNION ALL
     SELECT accepter_id AS id FROM RequestAccepted) AS friends
GROUP BY 
    id
ORDER BY 
    num DESC
LIMIT 1;

-- Solution 2: Using a Common Table Expression (CTE)
-- CTE helps to combine requester and accepter IDs, making the query more readable for complex cases.

WITH AllFriends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT 
    id,
    COUNT(*) AS num
FROM 
    AllFriends
GROUP BY 
    id
ORDER BY 
    num DESC
LIMIT 1;


hhhhh