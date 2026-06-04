/*
Problem: Weather Observation Station 4

Task:
Find the difference between the total number of CITY entries
and the number of distinct CITY entries in the STATION table.
*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;
