/*
Problem: Weather Observation Station 13

Task:
Find the sum of LAT_N values between
38.7880 and 137.2345.

Note:
- SUM() calculates the total latitude.
- WHERE filters the required range.
- TRUNCATE(value,4) keeps only 4 decimal places
  without rounding.
- Although ROUND(...,4) may pass some test cases,
  TRUNCATE(...,4) should be used because the
  question explicitly asks for truncation.

To remember:
Question says "rounded"   → ROUND()
Question says "rounded up" → CEIL()
Question says "rounded down" → FLOOR()
Question says "truncate" → TRUNCATE()

*/

SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880
  AND LAT_N < 137.2345;
