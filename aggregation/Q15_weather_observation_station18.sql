/*
Problem: Weather Observation Station 18

Task:
Calculate the Manhattan Distance between:
P1 = (MIN(LAT_N), MIN(LONG_W))
P2 = (MAX(LAT_N), MAX(LONG_W))

Formula:
|x1 - x2| + |y1 - y2|

Example:
P1 = (10, 20)
P2 = (30, 50)

Distance =
|10 - 30| + |20 - 50|
= 20 + 30
= 50
*/

SELECT ROUND(
    ABS(MAX(LAT_N) - MIN(LAT_N))
    + ABS(MAX(LONG_W) - MIN(LONG_W)),
    4
)
FROM STATION;
