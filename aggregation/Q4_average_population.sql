/*
Problem: Average Population

Task:
Find the average population of all cities
and round the result down to the nearest integer.

Note:
- AVG() calculates the average population.
- FLOOR() rounds a number down to the nearest integer.
- GROUP BY is not required because the question asks
  for one average value across the entire table.
- ROUND() rounds to the nearest integer, but the
  problem specifically requires rounding down,
  so FLOOR() must be used.

Example:
AVG(POPULATION) = 454321.89
FLOOR(454321.89) = 454321
*/

SELECT FLOOR(AVG(POPULATION))
FROM CITY;
