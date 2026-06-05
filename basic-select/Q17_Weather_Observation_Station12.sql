/*
Problem: Weather Observation Station 12

Task:
Display distinct city names from STATION that do not start
with a vowel (A, E, I, O, U) and do not end with a vowel
(A, E, I, O, U).
*/

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(CITY) NOT LIKE 'A%'
  AND UPPER(CITY) NOT LIKE 'E%'
  AND UPPER(CITY) NOT LIKE 'I%'
  AND UPPER(CITY) NOT LIKE 'O%'
  AND UPPER(CITY) NOT LIKE 'U%'
  AND UPPER(CITY) NOT LIKE '%A'
  AND UPPER(CITY) NOT LIKE '%E'
  AND UPPER(CITY) NOT LIKE '%I'
  AND UPPER(CITY) NOT LIKE '%O'
  AND UPPER(CITY) NOT LIKE '%U';
