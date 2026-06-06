/*
Problem: Revising Aggregations - The Sum Function

Task:
Find the total population of all cities
where the district is California.

Note:
- SUM() is an aggregate function used to calculate
  the total of a numeric column.
- WHERE DISTRICT = 'California' filters only the
  cities belonging to California.
- GROUP BY is not required because the question asks
  for a single total value, not separate totals
  for multiple districts.
*/

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
