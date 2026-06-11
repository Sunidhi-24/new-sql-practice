/*
Problem: Top Competitors

Task:
Find the hacker_id and name of hackers
who achieved full scores in more than
one challenge.

Output Requirements:
1. Display hacker_id and name.
2. Include only hackers who got full
   scores in more than one challenge.
3. Sort by:
   - Number of full-score challenges (DESC)
   - hacker_id (ASC)

Tables:
- Hackers
- Submissions
- Challenges
- Difficulty

Approach:
1. Join all four tables.
2. Match each submission with its
   challenge difficulty level.
3. Identify full-score submissions by
   comparing submission score with the
   maximum score for that difficulty.
4. Count the number of distinct challenges
   where each hacker achieved a full score.
5. Keep only hackers with more than one
   full-score challenge.
6. Sort according to the problem statement.

Key Concepts:
- INNER JOIN
  Combines related records from multiple tables.

- WHERE
  Filters submissions that achieved full score.

- COUNT(DISTINCT column)
  Counts unique challenges.

- GROUP BY
  Groups records by hacker.

- HAVING
  Filters grouped results.

Important Points:
- Full score means:
      Submission.Score = Difficulty.Score
- Use DISTINCT to avoid counting the
  same challenge multiple times.
- HAVING is used because COUNT() is
  an aggregate function.
*/

SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s
    ON h.hacker_id = s.hacker_id
JOIN Challenges c
    ON s.challenge_id = c.challenge_id
JOIN Difficulty d
    ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY COUNT(DISTINCT s.challenge_id) DESC,
         h.hacker_id ASC;
