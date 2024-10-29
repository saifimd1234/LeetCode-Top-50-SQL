# LeetCode Question 602: Friend Requests II: Who Has the Most Friends

## Table Structure

**Table: RequestAccepted**

| Column Name  | Type |
|--------------|------|
| requester_id | int  |
| accepter_id  | int  |
| accept_date  | date |

- **requester_id**: The ID of the user who sent the friend request.
- **accepter_id**: The ID of the user who received and accepted the request.
- **accept_date**: The date when the friend request was accepted.

## Description
The task is to find the person who has the highest number of friends. Only one person has the most friends.

## Example
**Input:**

**RequestAccepted Table:**
| requester_id | accepter_id | accept_date |
|--------------|-------------|-------------|
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |

**Output:**

| id | num |
|----|-----|
| 3  | 3   |

## Explanation
- Person with ID 3 has 3 friends: persons 1, 2, and 4.
- This is the maximum number of friends among all users, so the answer is ID 3 with a friend count of 3.