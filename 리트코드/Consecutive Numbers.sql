select distinct num as ConsecutiveNums
from (
         select
            num
            , lag(num) over w as prev
            , lead(num) over w as `next`
         from Logs
         window w as (order by id)
) as t
where num = prev and num = `next`