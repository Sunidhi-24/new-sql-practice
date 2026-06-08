/*
Problem: Weather Observation Station 19

Task:
Calculate the Euclidean Distance between:
P1 = (MIN(LAT_N), MIN(LONG_W))
P2 = (MAX(LAT_N), MAX(LONG_W))

Formula:
√((x2 - x1)² + (y2 - y1)²)

Example:
P1 = (10, 20)
P2 = (30, 50)

Distance =
√((30 - 10)² + (50 - 20)²)
= √(400 + 900)
= √1300
= 36.0555
*/

SELECT ROUND(
    SQRT(
        POW(MAX(LAT_N) - MIN(LAT_N), 2) +
        POW(MAX(LONG_W) - MIN(LONG_W), 2)
    ),
    4
)
FROM STATION;
