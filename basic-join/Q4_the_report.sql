/*
Problem: The Report

Task:
Generate a report with:
- Name
- Grade
- Marks

Rules:
1. If Grade >= 8, display the student's name.
2. If Grade < 8, display NULL instead of the name.
3. Sort by Grade in descending order.
4. For Grades 8-10:
   - Sort students alphabetically by Name.
5. For Grades 1-7:
   - Sort students by Marks in ascending order.

Tables:
STUDENTS and GRADES

Approach:
1. Join STUDENTS and GRADES tables.
2. Match each student's marks with the
   corresponding grade range using BETWEEN.
3. Use IF() (or CASE) to replace names with
   NULL when Grade < 8.
4. Apply custom sorting based on grade.

Key Concepts:
- INNER JOIN
  Combines STUDENTS and GRADES tables.

- BETWEEN
  Checks whether Marks fall within
  Min_Mark and Max_Mark.

- IF(condition, true_value, false_value)
  Displays NULL for grades below 8.

- CASE in ORDER BY
  Allows different sorting rules for
  different grade groups.

Important Points:
- Grade >= 8 → Show Name and sort by Name.
- Grade < 8 → Show NULL and sort by Marks.
- Always sort Grades in descending order first.
*/

SELECT
    IF(g.Grade < 8, NULL, s.Name),
    g.Grade,
    s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY
    g.Grade DESC,
    CASE WHEN g.Grade >= 8 THEN s.Name END,
    CASE WHEN g.Grade < 8 THEN s.Marks END;
