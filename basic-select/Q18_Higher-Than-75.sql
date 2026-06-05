/*
Problem: Higher Than 75 Marks

Task:
Display the names of students who scored more than 75 marks.
Order the results by the last three characters of each name.
If two names have the same last three characters, sort by ID.

Note:
- WHERE MARKS > 75 filters students with marks greater than 75.
- RIGHT(NAME, 3) extracts the last 3 characters of each name.
- ORDER BY RIGHT(NAME, 3), ID first sorts by the last 3 characters
  and then uses ID as a tie-breaker when they are the same.
*/

SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID;
