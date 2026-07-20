-- https://leetcode.com/problems/exchange-seats/description/
select
    id,
    case
        when id mod 2 = 1 then coalesce(lead(student) over(order by id), student)
        else lag(student) over(order by id)
        end as student
from seat
order by id;