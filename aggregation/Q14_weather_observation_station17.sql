/*
Problem: Weather Observation Station 17

Task:
Find the LONG_W value corresponding to the
smallest LAT_N that is greater than 38.7780.

Round the result to 4 decimal places.

Note:
- The inner query finds the minimum LAT_N
  that is greater than 38.7780.
- The outer query retrieves the LONG_W
  associated with that latitude.
- ROUND(LONG_W, 4) rounds the result
  to 4 decimal places.
*/

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
