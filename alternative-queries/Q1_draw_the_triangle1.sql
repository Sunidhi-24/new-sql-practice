/*
Problem: Draw The Triangle 1

Task:
Print the pattern P(20)

* * * * * 
* * * * 
* * * 
* * 
*
    
Important Notes:
1. MySQL does not have loops in a normal SELECT query.

2. Use a user-defined variable:
   @row = 21

3. Decrease the variable for each row:
   @row := @row - 1

4. REPEAT('* ', n)
   prints '* ' n times.

5. information_schema.tables is used
   only to generate 20 rows.

*/
    
SET @row = 21;

SELECT REPEAT('* ', @row := @row - 1)
FROM information_schema.tables
LIMIT 20;
