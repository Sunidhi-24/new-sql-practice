/*
Problem: Weather Observation Station 3

Task:
Display distinct CITY names from the STATION table
where the ID number is even.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;
