/*
Problem: Symmetric Pairs

Task:
Find all symmetric pairs from the Functions table.

A pair (X1, Y1) and (X2, Y2) is symmetric if:

X1 = Y2
AND
Y1 = X2

Output:
- X
- Y

Order by:
- X ascending

Important Notes:
1. For normal pairs:
   (a, b) ↔ (b, a)

   Example:
   (20, 21) and (21, 20)

2. Self-join the table to find matching reverse pairs.

3. Use:
   f1.X = f2.Y
   f1.Y = f2.X

4. To avoid duplicates:
   Keep only pairs where
   f1.X < f1.Y

   Example:
   Keep (20, 21)
   Ignore (21, 20)

5. Special Case:
   (a, a)

   Example:
   (13, 13)

   A symmetric pair exists only if
   the pair appears more than once.

6. Use:
   GROUP BY X, Y
   HAVING COUNT(*) > 1

7. UNION combines:
   - Normal symmetric pairs
   - Valid self-symmetric pairs
*/
    
SELECT f1.X, f1.Y
FROM Functions f1
JOIN Functions f2
    ON f1.X = f2.Y
   AND f1.Y = f2.X
WHERE f1.X < f1.Y

UNION

SELECT X, Y
FROM Functions
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) > 1

ORDER BY X ASC;
