/*
Problem: African Cities

Task:
Find the names of all cities that are
located in countries belonging to Africa.

Approach:
1. Join CITY and COUNTRY tables using:
   CITY.CountryCode = COUNTRY.Code
2. Filter countries where CONTINENT = 'Africa'.
3. Return the names of the matching cities.

Key Concepts:
- INNER JOIN
  Combines rows from CITY and COUNTRY
  based on matching country codes.

- WHERE
  Filters the results to include only
  countries in Africa.
*/

SELECT CITY.Name
FROM CITY
INNER JOIN COUNTRY
    ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Africa';
