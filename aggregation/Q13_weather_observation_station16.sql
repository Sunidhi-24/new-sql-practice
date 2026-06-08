/*
Problem: Weather Observation Station 16

Task:
Find the smallest LAT_N value that is
greater than 38.7780.

Round the result to 4 decimal places.

Note:
- WHERE LAT_N > 38.7780 filters the required rows.
- MIN(LAT_N) finds the smallest latitude
  among the filtered rows.
- ROUND(value, 4) rounds the result
  to 4 decimal places.

*/

SELECT ROUND(LAT_N, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
