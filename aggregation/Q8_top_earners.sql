/*
Problem: Top Earners

Task:
Find:
1. The maximum total earnings.
2. The number of employees who have that maximum earnings.

Definition:
Earnings = Salary * Months

Note:
- MAX(salary * months) finds the highest earnings in the table.
- We then count how many employees have that same maximum value.
- We use a subquery because we need to reuse the MAX value for filtering.
*/

SELECT
    MAX(salary * months) AS max_earnings,
    COUNT(*) AS employee_count
FROM Employee
WHERE salary * months = (
    SELECT MAX(salary * months)
    FROM Employee
);


/*Alternative solution:*/

SELECT salary * months,
       COUNT(*)
FROM Employee
GROUP BY salary * months
ORDER BY salary * months DESC
LIMIT 1;
