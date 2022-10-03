-- https://leetcode.com/problems/delete-duplicate-emails/
DELETE
FROM person
WHERE id NOT IN (
  SELECT MIN(id)
  FROM person
  GROUP BY email
);
