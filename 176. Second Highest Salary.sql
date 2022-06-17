/*
176. Second Highest Salary
Table: Employee
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.

Write an SQL query to report the second highest salary from the Employee table. 
If there is no second highest salary, the query should report null. 

Example 1:
Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Example 2:
Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/

-- Solution for Second Highest Salary

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- Using CTE Solution1

WITH CTE AS (SELECT DISTINCT salary
             FROM Employee 
             ORDER BY salary DESC
             LIMIT 2)
 SELECT salary AS SecondHighestSalary
 FROM CTE 
 ORDER BY salary ASC
 LIMIT 1;

-- Using CTE Solution2

WITH CTE AS (SELECT salary, 
             DENSE_RANK() OVER (ORDER BY salary DESC) AS DenseRank
             FROM Employee)
SELECT salary AS SecondHighestSalary
FROM CTE
WHERE DenseRank = 2;
