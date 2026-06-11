/*
Problem: Placements

Task:
Find the names of students whose best friend received
a higher salary offer than they did.

Output:
- Student Name

Order by:
- Friend's Salary (ascending)

Important Notes:
1. Students table:
   Contains student ID and Name.

2. Friends table:
   Maps each student to their best friend.
   ID → Friend_ID

3. Packages table:
   Contains salary offered to each student.

4. Packages table is joined twice:
   - sp = Student's Package
   - fp = Friend's Package

5. Compare salaries:
   Friend Salary > Student Salary

6. Return only the student's name.
*/

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages sp ON s.ID = sp.ID
JOIN Packages fp ON f.Friend_ID = fp.ID
WHERE fp.Salary > sp.Salary
ORDER BY fp.Salary ASC;
