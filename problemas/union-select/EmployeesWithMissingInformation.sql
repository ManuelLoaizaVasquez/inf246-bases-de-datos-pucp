-- https://leetcode.com/problems/employees-with-missing-information/
SELECT
    NVL(e.employee_id, s.employee_id) "employee_id"
FROM
    employees e
    FULL OUTER JOIN salaries s
    ON s.employee_id = e.employee_id
WHERE
    e.name IS NULL OR
    s.salary IS NULL
ORDER BY
    1 ASC;