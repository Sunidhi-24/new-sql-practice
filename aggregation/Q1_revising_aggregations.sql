/*
Problem: Revising Aggregations - The Count Function

Task:
Count the number of cities in the CITY table
having a population greater than 100000.

*/

SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION > 100000;
