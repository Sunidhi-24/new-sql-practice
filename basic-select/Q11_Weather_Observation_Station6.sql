/*
Problem: Weather Observation Station 6

Task:
Display distinct city names from STATION that start with a vowel
(A, E, I, O, U).
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%'
   OR CITY LIKE 'E%'
   OR CITY LIKE 'I%'
   OR CITY LIKE 'O%'
   OR CITY LIKE 'U%';
