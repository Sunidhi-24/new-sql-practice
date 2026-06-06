/*
Problem: The Blunder

Task:
Find the difference between:
1. The actual average salary.
2. Samantha's incorrect average salary after removing
   all zeros from salary values.

Round the final result up to the next integer.

Note:
- AVG(SALARY) calculates the actual average salary.
- REPLACE(SALARY,'0','') removes all zeros from salary.
- AVG(REPLACE(...)) calculates Samantha's incorrect average.
- Subtracting the two averages gives the error.
- CEIL() rounds the final answer up to the next integer.

REPLACE Syntax:
REPLACE(column, old_value, new_value)

Examples:
REPLACE('1000','0','') = 1
REPLACE('2050','0','') = 25
REPLACE('90807','0','') = 987

Example:
Actual salaries:
1000, 2050, 3000

After removing zeros:
1, 25, 3

Error =
AVG(Actual Salaries)
-
AVG(Salaries Without Zeros)

CEIL()    → Round up ↑
FLOOR()   → Round down ↓

*/

SELECT CEIL(
    AVG(SALARY) -
    AVG(REPLACE(SALARY, '0', ''))
)
FROM EMPLOYEES;
