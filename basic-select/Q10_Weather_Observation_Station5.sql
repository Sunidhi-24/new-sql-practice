/*
Problem: Weather Observation Station 5

Task:
Find the city with the shortest name and its length.
If there are ties, choose the city that comes first alphabetically.
*/

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

/*
Find the city with the longest name and its length.
If there are ties, choose the city that comes first alphabetically.
*/

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;
