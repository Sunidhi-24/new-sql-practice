/*
Problem: Print Prime Numbers

Task:
Print all prime numbers <= 1000
on a single line separated by '&'.

Important Notes:

Step 1: Generate Numbers (2 to 1000)
------------------------------------
SELECT @num := @num + 1 AS NUMB

Creates:
2, 3, 4, 5, ..., 1000

Example:
@num = 1
→ 2
→ 3
→ 4
→ ...

Step 2: Generate Possible Divisors
----------------------------------
SELECT @div := @div + 1 AS DIVI

Creates:
2, 3, 4, 5, ..., 1000

These numbers are used to test divisibility.

Step 3: Check for Factors
-------------------------
NUMB % DIVI = 0

Meaning:
DIVI divides NUMB exactly.

Example:
8 % 2 = 0  → Factor exists
7 % 2 = 1  → Not a factor

Step 4: Ignore 1 and NUMB itself
--------------------------------
DIVI > 1
AND DIVI < NUMB

Reason:
Every number is divisible by:
1 and itself

We only check for other factors.

Step 5: Prime Condition
-----------------------
WHERE NOT EXISTS (...)

Keep NUMB only when
NO divisor is found.

Example:
7:
7%2,7%3,7%4,7%5,7%6 ≠ 0
→ Prime

8:
8%2 = 0
→ Not Prime

Step 6: Print on One Line
-------------------------
GROUP_CONCAT(NUMB SEPARATOR '&')

Converts:

2
3
5
7

into:

2&3&5&7

Concepts Used:
- Variables (@num, @div)
- MOD (%) Operator
- NOT EXISTS
- GROUP_CONCAT()
*/
    
SELECT GROUP_CONCAT(NUMB SEPARATOR '&')
FROM
(
    SELECT @num := @num + 1 AS NUMB
    FROM information_schema.tables t1,
         information_schema.tables t2,
         (SELECT @num := 1) r
    LIMIT 999
) AllNums

WHERE NOT EXISTS
(
    SELECT 1
    FROM
    (
        SELECT @div := @div + 1 AS DIVI
        FROM information_schema.tables t1,
             information_schema.tables t2,
             (SELECT @div := 1) r
        LIMIT 999
    ) Divisors

    WHERE NUMB % DIVI = 0
      AND DIVI > 1
      AND DIVI < NUMB
);
