/*
Problem: Population Census

Task:
Find the total population of all cities
located in countries that belong to Asia.

Tables:
CITY and COUNTRY

Approach:
1. Join CITY and COUNTRY tables using:
   CITY.CountryCode = COUNTRY.Code
2. Filter countries where CONTINENT = 'Asia'.
3. Sum the population of all matching cities.

Key Concepts:
- INNER JOIN
  Combines rows from CITY and COUNTRY
  based on matching country codes.

- SUM(column)
  Calculates the total population.
*/

SELECT SUM(CITY.Population)
FROM CITY
INNER JOIN COUNTRY
    ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Asia';
