/*
182. Duplicate Emails
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write an SQL query to report all the duplicate emails.

Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times
*/

-- Solution for Duplicate Emails

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- Using CTE 

WITH CTE AS(SELECT email,
           ROW_NUMBER() OVER (PARTITION BY email ORDER BY email) AS rn
           FROM Person)
SELECT email AS Email
FROM CTE
WHERE rn > 1;