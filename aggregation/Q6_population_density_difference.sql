/*
Problem: Population Density Difference

Task:
Find the difference between the highest and
lowest population values in the CITY table.

Note:
- MAX() returns the largest population value.
- MIN() returns the smallest population value.
- GROUP BY is not required because the question asks
  for a single value across the entire table.

Formula:
Difference = MAX(POPULATION) - MIN(POPULATION)
*/

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;
