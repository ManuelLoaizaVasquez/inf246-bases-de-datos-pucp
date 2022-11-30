-- https://leetcode.com/problems/patients-with-a-condition/
SELECT
    *
FROM
    patients
WHERE
    conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
ORDER BY
    1 ASC;
