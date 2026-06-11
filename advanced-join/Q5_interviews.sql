# Interviews

## Problem

For each contest print:

* contest_id
* hacker_id
* name
* total_submissions
* total_accepted_submissions
* total_views
* total_unique_views

Exclude contests where all totals are 0.

Sort by contest_id.

---

## Table Relationships

```text
Contests
    |
    ↓
Colleges
    |
    ↓
Challenges
    |
    ↓
 ┌─────────────┐
 ↓             ↓
View_Stats   Submission_Stats
```

---

## Step 1: Start From Contests

```sql
FROM Contests c
```

Each contest should appear once in the final result.

---

## Step 2: Join Colleges

```sql
JOIN Colleges co
ON c.contest_id = co.contest_id
```

Relationship:

```text
Contest → College
```

A contest can be used by multiple colleges.

---

## Step 3: Join Challenges

```sql
JOIN Challenges ch
ON co.college_id = ch.college_id
```

Relationship:

```text
College → Challenges
```

A college can have multiple challenges.

---

## Step 4: Aggregate Submission Statistics

```sql
SELECT challenge_id,
       SUM(total_submissions),
       SUM(total_accepted_submissions)
FROM Submission_Stats
GROUP BY challenge_id
```

Purpose:

```text
Combine all submission records
for each challenge.
```

---

## Step 5: Aggregate View Statistics

```sql
SELECT challenge_id,
       SUM(total_views),
       SUM(total_unique_views)
FROM View_Stats
GROUP BY challenge_id
```

Purpose:

```text
Combine all view records
for each challenge.
```

---

## Step 6: Join Aggregated Statistics

```sql
LEFT JOIN submission_stats
LEFT JOIN view_stats
```

Now each challenge contains:

```text
total_submissions
total_accepted_submissions
total_views
total_unique_views
```

---

## Step 7: Group By Contest

```sql
GROUP BY
c.contest_id,
c.hacker_id,
c.name
```

This combines all challenge statistics belonging to the same contest.

---

## Step 8: Calculate Totals

```sql
SUM(ss.total_submissions)

SUM(ss.total_accepted_submissions)

SUM(vs.total_views)

SUM(vs.total_unique_views)
```

Adds all challenge statistics for the contest.

---

## Step 9: Remove Empty Contests

```sql
HAVING
SUM(submissions)
+
SUM(accepted_submissions)
+
SUM(views)
+
SUM(unique_views)
> 0
```

If all values are zero:

```text
0 + 0 + 0 + 0
```

the contest is excluded.

---

## Step 10: Sort Results

```sql
ORDER BY contest_id
```

Ascending order.

---

## Important Notes

1. Contest → College → Challenge is the join path.
2. Aggregate Submission_Stats first.
3. Aggregate View_Stats first.
4. Then join aggregated results.
5. Group by contest.
6. Use HAVING to remove contests with all zeros.
7. "Aggregate First, Then Join" is the main concept.

---

## Memory Trick

```text
Contest
   ↓
College
   ↓
Challenge
   ↓
Views + Submissions
   ↓
SUM
   ↓
GROUP BY Contest
   ↓
HAVING Total > 0
```

---

## Final Query

```sql
SELECT
    c.contest_id,
    c.hacker_id,
    c.name,
    SUM(ss.total_submissions),
    SUM(ss.total_accepted_submissions),
    SUM(vs.total_views),
    SUM(vs.total_unique_views)
FROM Contests c

JOIN Colleges co
    ON c.contest_id = co.contest_id

JOIN Challenges ch
    ON co.college_id = ch.college_id

LEFT JOIN
(
    SELECT challenge_id,
           SUM(total_submissions) AS total_submissions,
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) ss
    ON ch.challenge_id = ss.challenge_id

LEFT JOIN
(
    SELECT challenge_id,
           SUM(total_views) AS total_views,
           SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) vs
    ON ch.challenge_id = vs.challenge_id

GROUP BY
    c.contest_id,
    c.hacker_id,
    c.name

HAVING
    SUM(ss.total_submissions) +
    SUM(ss.total_accepted_submissions) +
    SUM(vs.total_views) +
    SUM(vs.total_unique_views) > 0

ORDER BY c.contest_id;
```
