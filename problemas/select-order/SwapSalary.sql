-- https://leetcode.com/problems/swap-salary/
UPDATE
salary
SET
sex = DECODE(sex, 'f', 'm', 'm', 'f');
