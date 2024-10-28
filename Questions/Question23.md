# LeetCode Question 2356: Number of Unique Subjects Taught by Each Teacher

## Table Structure

**Table: Teacher**

| Column Name | Type |
|-------------|------|
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |

- **teacher_id**: The ID of the teacher.
- **subject_id**: The ID of the subject.
- **dept_id**: The ID of the department.

- **(subject_id, dept_id)** is the primary key, meaning each row is unique by subject and department.

## Description
This task is to calculate the number of unique subjects each teacher teaches. If a teacher teaches the same subject in multiple departments, count it only once.

### Example
Input:
```plaintext
| teacher_id | subject_id | dept_id |
|------------|------------|---------|
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |

### Output:
| teacher_id | cnt |
|------------|-----|
| 1          | 2   |
| 2          | 4   |