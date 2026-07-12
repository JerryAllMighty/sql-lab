# Write your MySQL query statement below
# https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
with cte as (
    select
    *
    , row_number() over(partition by managerId order by managerId asc) as rn
    from employee
)
select
    name
from employee
where id in (
    select
        distinct managerId
    from cte
    where rn >= 5
)