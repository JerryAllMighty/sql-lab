# https://leetcode.com/problems/tree-node/description/
# Write your MySQL query statement below

with parent_ids as (
    select distinct p_id
    from tree
    where p_id is not null
)
select
    t.id
     , case
           when t.p_id is null then 'Root'
           when pi.p_id is not null then 'Inner'
           else 'Leaf'
    end as `type`
from tree t
left join parent_ids pi on pi.p_id = t.id;