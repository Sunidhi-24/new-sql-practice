/*
Problem: Draw The Triangle 2

Task:
Print the pattern P(20)

* 
* * 
* * * 
* * * * 
* * * * *

Important Notes:
1. Use a variable:
   @n = 0

2. Increase the variable for each row:
   @n := @n + 1

3. REPEAT('* ', n)
   prints '* ' n times.

4. information_schema.tables is used
   only to generate rows.

5. LIMIT 20 ensures exactly 20 rows.
*/
    
SET @n = 0;

SELECT REPEAT('* ', @n := @n + 1)
FROM information_schema.tables
LIMIT 20;
