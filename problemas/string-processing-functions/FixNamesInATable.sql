-- https://leetcode.com/problems/fix-names-in-a-table/
SELECT
    user_id "user_id",
    INITCAP(name) "name"
FROM
    users
ORDER BY
    1 ASC;
