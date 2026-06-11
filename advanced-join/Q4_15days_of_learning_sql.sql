# 15 Days of Learning SQL

## Problem

For each contest day:

1. Count the number of hackers who have made at least one submission every day from March 1, 2016 up to the current day.
2. Find the hacker who made the maximum submissions on that day.
3. If multiple hackers have the same maximum submissions, choose the hacker with the lowest `hacker_id`.

Output:

* submission_date
* total_hackers
* hacker_id
* name

Ordered by submission_date.

---

## Step 1: Find Hackers Who Submitted Every Day

```sql
SELECT hacker_id
FROM Submissions s2
WHERE s2.submission_date <= current_date
GROUP BY hacker_id
HAVING COUNT(DISTINCT submission_date) =
       DATEDIFF(current_date,'2016-03-01') + 1
```

### What this does

For each hacker:

Count how many different days they submitted.

Example for March 05:

```text
March 01
March 02
March 03
March 04
March 05
```

Total required days = 5

```sql
DATEDIFF('2016-03-05','2016-03-01') + 1
= 4 + 1
= 5
```

If a hacker submitted on all 5 days:

```text
COUNT(DISTINCT submission_date) = 5
```

Keep that hacker.

If they missed even one day:

```text
COUNT(DISTINCT submission_date) < 5
```

Remove that hacker.

---

## Step 2: Count Daily Submissions

```sql
SELECT submission_date,
       hacker_id,
       COUNT(*) AS submissions
FROM Submissions
GROUP BY submission_date, hacker_id;
```

### Example

Suppose on March 02:

```text
Hacker 101 → 5 submissions
Hacker 102 → 2 submissions
Hacker 103 → 5 submissions
```

Result:

```text
2016-03-02 101 5
2016-03-02 102 2
2016-03-02 103 5
```

---

## Step 3: Rank Hackers Per Day

```sql
ROW_NUMBER() OVER
(
    PARTITION BY submission_date
    ORDER BY COUNT(*) DESC, hacker_id ASC
)
```

### What this does

For each date:

Sort by:

1. Highest submissions first
2. Lowest hacker_id if tie

Example:

```text
Date: 2016-03-02

101 → 5 submissions
103 → 5 submissions
102 → 2 submissions
```

After sorting:

```text
101 → Rank 1
103 → Rank 2
102 → Rank 3
```

Why?

```text
Both have 5 submissions.

Lowest hacker_id wins.
```

---

## Step 4: Keep Only Daily Winner

```sql
WHERE rn = 1
```

Example:

```text
Rank 1 → Keep
Rank 2 → Remove
Rank 3 → Remove
```

Result:

```text
Only the winner remains.
```

---

## Step 5: Get Hacker Name

```sql
JOIN Hackers h
ON t.hacker_id = h.hacker_id
```

Example:

```text
101 → Angela
102 → Michael
```

Now we can print:

```text
101 Angela
```

instead of only:

```text
101
```

---

## Step 6: Count Continuous Hackers

```sql
SELECT COUNT(*)
FROM (...)
```

Counts hackers who submitted every day from March 1 until the current day.

Example:

```text
March 01 → 4 hackers
March 02 → 2 hackers
March 03 → 2 hackers
March 04 → 2 hackers
March 05 → 1 hacker
March 06 → 1 hacker
```

---

## Step 7: Final Output

Example:

```text
2016-03-01 4 20703 Angela
2016-03-02 2 79722 Michael
2016-03-03 2 20703 Angela
2016-03-04 2 20703 Angela
2016-03-05 1 36396 Frank
2016-03-06 1 20703 Angela
```

---

## Final Query

```sql
SELECT
    s.submission_date,
    (
        SELECT COUNT(*)
        FROM
        (
            SELECT hacker_id
            FROM Submissions s2
            WHERE s2.submission_date <= s.submission_date
            GROUP BY hacker_id
            HAVING COUNT(DISTINCT submission_date) =
                   DATEDIFF(s.submission_date,'2016-03-01') + 1
        ) x
    ) AS total_hackers,
    h.hacker_id,
    h.name
FROM
(
    SELECT submission_date,
           hacker_id,
           ROW_NUMBER() OVER
           (
               PARTITION BY submission_date
               ORDER BY COUNT(*) DESC, hacker_id
           ) rn
    FROM Submissions
    GROUP BY submission_date, hacker_id
) t
JOIN Hackers h
    ON t.hacker_id = h.hacker_id
JOIN Submissions s
    ON t.submission_date = s.submission_date
WHERE rn = 1
GROUP BY s.submission_date, h.hacker_id, h.name
ORDER BY s.submission_date;
```

---

## Important Notes

1. `COUNT(DISTINCT submission_date)` checks submission streaks.
2. `DATEDIFF() + 1` calculates how many days should exist from March 1 to the current date.
3. `ROW_NUMBER()` finds the daily winner.
4. `ORDER BY COUNT(*) DESC, hacker_id ASC` handles ties.
5. `rn = 1` keeps only the top hacker each day.
6. Join with `Hackers` to get the hacker's name.

---

## Memory Trick

```text
For each day:

Find hackers with full streak
            ↓
Count them
            ↓
Find daily submission counts
            ↓
Rank by submissions
            ↓
Tie → Lowest hacker_id
            ↓
Pick Rank 1
            ↓
Print result
```
