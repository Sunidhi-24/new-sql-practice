/*
Problem: Average Population of Each Continent

Task:
Find each continent and its average
city population, rounded down to the
nearest integer.

Approach:
1. Join CITY and COUNTRY tables using:
   CITY.CountryCode = COUNTRY.Code
2. Group cities by continent.
3. Calculate the average population
   of cities in each continent.
4. Use FLOOR() to round down the result.

Key Concepts:
- INNER JOIN
  Combines rows from CITY and COUNTRY
  using matching country codes.

- AVG(column)
  Calculates the average population.

- FLOOR(value)
  Rounds a number down to the nearest
  integer.

- GROUP BY
  Creates one result row per continent.

Example:

Asia:
1000, 2000, 3000

AVG = 2000
FLOOR(2000) = 2000

Europe:
1500, 2500

AVG = 2000
FLOOR(2000) = 2000
*/

SELECT COUNTRY.Continent,
       FLOOR(AVG(CITY.Population))
FROM CITY
INNER JOIN COUNTRY
    ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;
