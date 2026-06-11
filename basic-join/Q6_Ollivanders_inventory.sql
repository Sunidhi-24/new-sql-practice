/*
Problem: Ollivander's Inventory

Task:
Find the id, age, coins_needed, and power
of the cheapest non-evil wand for each
(age, power) combination.

Output:
- id
- age
- coins_needed
- power

Sorting:
1. power DESC
2. age DESC

Tables:
- Wands
- Wands_Property

Approach:
1. Join Wands and Wands_Property using code.
2. Remove evil wands (is_evil = 1).
3. For each combination of:
      power
      age
   find the minimum coins_needed.
4. Keep only the wand whose cost equals
   that minimum value.
5. Sort by power descending and age descending.

Key Concepts:
- INNER JOIN
  Combines wand details with wand properties.

- Correlated Subquery
  Uses values from the current row
  (power and age) inside the subquery.

- MIN()
  Finds the lowest coins_needed.

Important Points:
- Ignore evil wands:
      is_evil = 0

- Compare only wands having the same:
      power
      age

- Keep the cheapest wand in each group.

Example:
Power = 7, Age = 40

Available Wands:
6773
6018
8798

MIN(coins_needed) = 6018

Therefore only the wand costing 6018
is included in the final result.

Query Flow:
JOIN
→ Remove evil wands
→ Group by (power, age)
→ Find MIN(coins_needed)
→ Keep cheapest wand
→ Sort results
*/

SELECT w.id,
       p.age,
       w.coins_needed,
       w.power
FROM Wands w
JOIN Wands_Property p
ON w.code = p.code
WHERE p.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w1.coins_needed)
    FROM Wands w1
    JOIN Wands_Property p1
    ON w1.code = p1.code
    WHERE p1.is_evil = 0
      AND w1.power = w.power
      AND p1.age = p.age
)
ORDER BY w.power DESC,
         p.age DESC;
