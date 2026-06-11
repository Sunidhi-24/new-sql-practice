/*
Problem: Contest Leaderboard

Task:
Calculate the total score for each hacker.

Rules:
1. For each challenge, consider only the
   highest score achieved by the hacker.
2. Sum the highest scores across all
   challenges attempted by the hacker.
3. Exclude hackers whose total score is 0.
4. Sort by:
   - total_score DESC
   - hacker_id ASC

Tables:
- Hackers
- Submissions

Approach:
1. Find the maximum score obtained by each
   hacker for every challenge.
2. Join the result with Hackers table.
3. Sum all maximum scores for each hacker.
4. Remove hackers with total score = 0.
5. Sort according to the problem statement.

Key Concepts:
- MAX()
  Finds the highest score for a challenge.

- GROUP BY
  Groups submissions by hacker and challenge.

- SUM()
  Calculates total leaderboard score.

- HAVING
  Filters grouped results.

Important Points:
- Do NOT sum all submissions.
- Count only the highest score per challenge.
- A challenge contributes only once to the
  hacker's total score.
- Hackers with total score 0 are excluded.

Query Flow:
Submissions
→ MAX(score) per hacker per challenge
→ JOIN Hackers
→ SUM(max_score)
→ HAVING total_score > 0
→ ORDER BY result
*/

SELECT h.hacker_id,
       h.name,
       SUM(ms.max_score) AS total_score
FROM Hackers h
JOIN (
    SELECT hacker_id,
           challenge_id,
           MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) ms
ON h.hacker_id = ms.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC,
         h.hacker_id ASC;
