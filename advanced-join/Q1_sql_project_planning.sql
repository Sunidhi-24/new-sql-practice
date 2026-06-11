/*
Problem: SQL Project Planning

Task:
Find the start and end dates of each project.

A project consists of tasks whose dates are consecutive
(i.e., End_Date of one task = Start_Date of the next task).

Output:
- Project Start Date
- Project End Date

Order by:
1. Project duration (ascending)
2. Start date (ascending)

Important Notes:
1. Project Start Date:
   A Start_Date that does NOT appear as any End_Date.

2. Project End Date:
   An End_Date that does NOT appear as any Start_Date.

3. Join all possible project starts with project ends
   where Start_Date < End_Date.

4. Use MIN(End_Date) to get the nearest valid end date
   for each project.

*/

SELECT Start_Date, MIN(End_Date)
FROM
    (SELECT Start_Date
     FROM Projects
     WHERE Start_Date NOT IN
           (SELECT End_Date FROM Projects)) AS Project_Starts,

    (SELECT End_Date
     FROM Projects
     WHERE End_Date NOT IN
           (SELECT Start_Date FROM Projects)) AS Project_Ends

WHERE Start_Date < End_Date

GROUP BY Start_Date

ORDER BY DATEDIFF(MIN(End_Date), Start_Date),
         Start_Date;
