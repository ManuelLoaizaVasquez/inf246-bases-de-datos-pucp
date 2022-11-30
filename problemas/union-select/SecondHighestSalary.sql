-- https://leetcode.com/problems/second-highest-salary/
SELECT
    MAX(salary) AS "SecondHighestSalary"
FROM
    employee
WHERE
    salary < (
        SELECT
            MAX(SALARY)
        FROM
            employee
    );