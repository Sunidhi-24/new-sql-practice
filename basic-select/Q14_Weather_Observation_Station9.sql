/*
Problem: Weather Observation Station 9

Task:
Display distinct city names from STATION that do not start
with a vowel (A, E, I, O, U).
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
  AND CITY NOT LIKE 'E%'
  AND CITY NOT LIKE 'I%'
  AND CITY NOT LIKE 'O%'
  AND CITY NOT LIKE 'U%';
