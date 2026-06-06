/*
Problem: Japan Population

Task:
Find the total population of all cities
where the country code is JPN (Japan).
*/

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';
