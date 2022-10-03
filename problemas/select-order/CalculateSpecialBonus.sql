-- https://leetcode.com/problems/calculate-special-bonus/
SELECT
employee_id AS employee_id,
DECODE(MOD(employee_id, 2), 1, DECODE(SUBSTR(name, 1, 1), 'M', 0, salary), 0) AS bonus
FROM
employees
ORDER BY
1 ASC;
