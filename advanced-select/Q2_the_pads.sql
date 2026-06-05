/*
Problem: The PADS

Task:
1. Print each name followed by the first letter of the occupation.
2. Print the count of each occupation in the required format.

Note:
- CONCAT() joins strings together.
- LEFT(OCCUPATION,1) extracts the first letter.
- GROUP BY OCCUPATION groups records by profession.
- COUNT(*) counts the number of occurrences.
- LOWER() converts occupation names to lowercase.
*/

SELECT CONCAT(NAME, '(', LEFT(OCCUPATION,1), ')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT(
    'There are a total of ',
    COUNT(*),
    ' ',
    LOWER(OCCUPATION),
    's.'
)
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(*), OCCUPATION;
