/*
Problem: Revising Aggregations - Averages

Task:
Find the average population of all cities
where the district is California.

Note:
- AVG() is an aggregate function used to calculate
  the average value of a numeric column.
- WHERE DISTRICT = 'California' filters only the
  cities belonging to California.
- GROUP BY is not required because the question asks
  for a single average value for one district.

Formula:
Average = SUM(POPULATION) / COUNT(POPULATION)
*/

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
