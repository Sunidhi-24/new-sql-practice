/*
Problem: Weather Observation Station 14

Task:
Find the greatest LAT_N value that is
less than 137.2345.

Truncate the result to 4 decimal places.

Note:
- WHERE LAT_N < 137.2345 filters the required rows.
- MAX(LAT_N) finds the largest latitude value
  among the filtered rows.
- TRUNCATE(value, 4) keeps only 4 decimal places
  without rounding.

Example:
LAT_N values:
120.12345
136.98765
137.01937

MAX(LAT_N) = 137.01937

TRUNCATE(137.01937, 4)
= 137.0193
*/

SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;
