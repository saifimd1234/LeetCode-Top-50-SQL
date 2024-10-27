# SQL Question: Contest Registration Percentage

## Tables

### Table: Users
| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| user_name   | varchar |

- `user_id` is the primary key for this table.
- Each row contains the name and ID of a user.

### Table: Register
| Column Name | Type |
|-------------|------|
| contest_id  | int  |
| user_id     | int  |

- `(contest_id, user_id)` is the primary key for this table.
- Each row contains the ID of a user and the contest they registered into.

## Task
Write a solution to find the percentage of users registered in each contest, rounded to two decimals.

- Return the result table ordered by `percentage` in descending order.
- In case of a tie, order by `contest_id` in ascending order.

## Example

### Input
**Users Table**:
| user_id | user_name |
|---------|-----------|
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |

**Register Table**:
| contest_id | user_id |
|------------|---------|
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |

### Output
| contest_id | percentage |
|------------|------------|
| 208        | 100.0      |
| 209        | 100.0      |
| 210        | 100.0      |
| 215        | 66.67      |
| 207        | 33.33      |

### Explanation
- All users registered in contests `208`, `209`, and `210`, giving them a percentage of 100%.
- `Alice` and `Alex` registered in contest `215`, resulting in a percentage of `66.67%`.
- `Bob` registered in contest `207`, resulting in a percentage of `33.33%`.