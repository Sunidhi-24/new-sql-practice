/*
Problem: Weather Observation Station 15

Task:
Find the LONG_W value corresponding to the
largest LAT_N that is less than 137.2345.

Round the result to 4 decimal places.

Note:
- The inner query finds the maximum LAT_N
  that is less than 137.2345.
- The outer query retrieves the LONG_W
  associated with that latitude.
- ROUND(LONG_W, 4) rounds the result
  to 4 decimal places.
*/

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);
