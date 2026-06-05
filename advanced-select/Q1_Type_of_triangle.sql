/*
Problem: Type of Triangle

Task:
Identify the type of each triangle based on side lengths A, B, and C.

Types:
- Equilateral: All three sides are equal.
- Isosceles: Exactly two sides are equal.
- Scalene: All three sides are different.
- Not A Triangle: Triangle inequality is not satisfied.

Note:
- CASE is used when different outputs need to be returned
  based on multiple conditions.
- Conditions are checked from top to bottom.
- The first matching condition is returned.
- "Not A Triangle" is checked first because an invalid
  triangle should not be classified as Equilateral,
  Isosceles, or Scalene.
*/

SELECT
CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A
        THEN 'Not A Triangle'
    WHEN A = B AND B = C
        THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C
        THEN 'Isosceles'
    ELSE 'Scalene'
END
FROM TRIANGLES;
