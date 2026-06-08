/*
Problem: Weather Observation Station 20

Task:
Find the median value of LAT_N
and round the result to 4 decimal places.

Approach:
1. Sort all LAT_N values in ascending order.
2. Assign a row number to each value.
3. Count the total number of rows.
4. Identify the middle row(s).
5. Calculate the average of the middle row(s)
   to obtain the median.
6. Round the result to 4 decimal places.

Key Functions:
- ROW_NUMBER() OVER (ORDER BY LAT_N)
  Assigns a sequential position to each row
  after sorting by LAT_N.

- COUNT(*) OVER ()
  Returns the total number of rows and
  displays it for every row.

- AVG(LAT_N)
  Calculates the median value.
  For an odd number of rows, it returns
  the middle value.
  For an even number of rows, it returns
  the average of the two middle values.

- ROUND(value, 4)
  Formats the answer to 4 decimal places.

Example:

LAT_N values:
10
20
30
40
50

After sorting:

LAT_N   rn   cnt
-----   --   ---
10      1     5
20      2     5
30      3     5
40      4     5
50      5     5

Middle positions:
(cnt + 1) / 2 = 3
(cnt + 2) / 2 = 3

Median:
AVG(30) = 30

Result:
30.0000
*/

SELECT ROUND(AVG(LAT_N), 4)
FROM (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS cnt
    FROM STATION
) s
WHERE rn IN ((cnt + 1) / 2, (cnt + 2) / 2);
