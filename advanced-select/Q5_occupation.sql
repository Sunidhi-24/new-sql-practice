/*
Problem: Occupations

Task:
Pivot the OCCUPATION column so that names are displayed
under their respective occupation columns:
Doctor, Professor, Singer, and Actor.

Note:
- ROW_NUMBER() assigns a position number (R) to each name
  within its occupation after sorting alphabetically.
- PARTITION BY OCCUPATION restarts numbering for each
  occupation separately.
- IF() places names into their corresponding occupation
  column and returns NULL for other occupations.
- GROUP BY R aligns names having the same position number
  into the same output row.
- MAX() is used to select the non-NULL value from each
  occupation column within a group.
- ORDER BY R ensures rows are displayed in the correct order.

Example:
Doctor      Professor     Singer     Actor
Jenny       Ashley        Meera      Jane
Samantha    Christeen     Priya      Julia
NULL        Ketty         NULL       Maria
*/

WITH T AS (
    SELECT
        NAME,
        OCCUPATION,
        ROW_NUMBER() OVER(
            PARTITION BY OCCUPATION
            ORDER BY NAME
        ) R
    FROM OCCUPATIONS
)

SELECT
    MAX(IF(OCCUPATION = 'Doctor', NAME, NULL)) Doctor,
    MAX(IF(OCCUPATION = 'Professor', NAME, NULL)) Professor,
    MAX(IF(OCCUPATION = 'Singer', NAME, NULL)) Singer,
    MAX(IF(OCCUPATION = 'Actor', NAME, NULL)) Actor
FROM T
GROUP BY R
ORDER BY R;
