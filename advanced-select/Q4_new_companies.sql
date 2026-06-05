/*
Problem: New Companies

Task:
Print:
- company_code
- founder
- total number of lead managers
- total number of senior managers
- total number of managers
- total number of employees

Note:
- LEFT JOIN is used to keep all companies in the result,
  even if some hierarchy levels are missing.
- COUNT(DISTINCT ...) counts unique managers/employees
  because duplicate records may exist.
- When using COUNT() along with normal columns
  (company_code, founder), GROUP BY is required so SQL
  knows how to aggregate the rows.
- GROUP BY company_code, founder creates one output row
  per company and calculates counts for that company.
- ORDER BY company_code sorts the final result in
  ascending company code order.
*/

SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lm
    ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm
    ON c.company_code = sm.company_code
LEFT JOIN Manager m
    ON c.company_code = m.company_code
LEFT JOIN Employee e
    ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
