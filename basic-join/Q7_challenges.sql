/*
Problem: Challenges

Task:
Print:
- hacker_id
- name
- total challenges created

Rules:
1. Include hackers with the maximum
   challenge count.
2. Include hackers whose challenge
   count is unique.
3. Exclude hackers whose challenge
   count is repeated and not maximum.

Approach:
1. Join Hackers and Challenges tables.
2. Count challenges created by each hacker.
3. Keep:
   - Maximum count
   - Unique counts
4. Sort by total challenges (DESC)
   and hacker_id (ASC).

Key Concepts:
- JOIN
  Combines hacker and challenge data.

- COUNT()
  Counts challenges created by a hacker.

- GROUP BY
  Creates one group per hacker.

- HAVING
  Filters grouped results.

Notes:
- MAX(cnt) finds the highest challenge count.
- HAVING COUNT(*) = 1 finds counts that
  occur only once (unique counts).
- Duplicate counts are removed unless
  they are the maximum count.

Query Flow:
JOIN
→ COUNT challenges
→ GROUP BY hacker
→ Keep MAX count
→ Keep unique counts
→ ORDER BY result
*/

SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS total
FROM Hackers h
JOIN Challenges c
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING COUNT(c.challenge_id) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Challenges
        GROUP BY hacker_id
    ) sub1
)
OR COUNT(c.challenge_id) IN (
    SELECT cnt
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Challenges
        GROUP BY hacker_id
    ) sub2
    GROUP BY cnt
    HAVING COUNT(*) = 1
)
ORDER BY total DESC, h.hacker_id ASC;
