-- https://leetcode.com/problems/tree-node/
SELECT
    *
FROM (
    SELECT
        id,
        'Root' AS "type"
    FROM
        tree
    WHERE
        p_id IS NULL
    UNION
    SELECT
        t.id,
        'Inner' AS "type"
    FROM
        tree t
    WHERE
        t.p_id IS NOT NULL AND
        (
            SELECT
                COUNT(*)
            FROM
                tree s
            WHERE
                s.p_id = t.id
        ) > 0
    UNION
    SELECT
        t.id,
        'Leaf' AS "type"
    FROM
        tree t
    WHERE
        t.p_id IS NOT NULL AND
        (
            SELECT
                COUNT(*)
            FROM
                tree s
            WHERE
                s.p_id = t.id
        ) = 0
    
)
ORDER BY
    1 ASC;