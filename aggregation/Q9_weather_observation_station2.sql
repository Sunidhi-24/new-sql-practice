/*
Problem: Weather Observation Station 2

Task:
Find:
1. Sum of all LAT_N values rounded to 2 decimal places
2. Sum of all LONG_W values rounded to 2 decimal places

Note:
- SUM() adds all values in a column
- ROUND(value, 2) rounds result to 2 decimal places
- No GROUP BY needed because we want total sum of entire table
*/

SELECT 
    ROUND(SUM(LAT_N), 2),
    ROUND(SUM(LONG_W), 2)
FROM STATION;
