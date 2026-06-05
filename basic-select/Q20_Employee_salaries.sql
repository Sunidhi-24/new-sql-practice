/*
Problem: Employee Salaries

Task:
Display the names of employees who earn more than 2000
per month and have worked for less than 10 months.
Order the results by employee_id in ascending order.
*/

SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000
  AND MONTHS < 10
ORDER BY EMPLOYEE_ID;
