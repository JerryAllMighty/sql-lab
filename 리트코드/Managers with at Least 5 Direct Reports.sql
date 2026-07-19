# Write your MySQL query statement below
# https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
select name
from employee
where id in (
    select managerId from employee
    group by managerId
    having count(*) >= 5
)