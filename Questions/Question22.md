## Question 550: Game Play Analysis IV

### Table Structure
#### Table: `Activity`
| Column Name  | Type    |
|--------------|---------|
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |

- The `(player_id, event_date)` is a unique combination (primary key).
- Each row represents a player's session on a given date and device.

### Task
1. Calculate the fraction of players who logged in consecutively starting from the day after their first login.
2. Round the result to 2 decimal places.

### Example

#### Input:
Activity Table:
| player_id | device_id | event_date | games_played |
|-----------|-----------|------------|--------------|
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |

#### Output:
| fraction  |
|-----------|
| 0.33      |

#### Explanation:
- Player 1 logged in on `2016-03-01` and again on `2016-03-02`, making them a consecutive day logger.
- Players 2 and 3 did not log in on consecutive days starting from their first login date.
- Fraction of consecutive day logins: `1 / 3 = 0.33`