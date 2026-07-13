-- https://leetcode.com/problems/exchange-seats/description/

select
    id
     , case
           when s.id mod 2 = 1 then
               case
                   when s.id < (
                       select count(*)
                       from seat
                   ) then (select student from seat where id = s.id + 1)
                   else s.student
                   end
           else (select student from seat where id = s.id - 1)
    end as student
from seat s