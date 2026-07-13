-- https://leetcode.com/problems/product-sales-analysis-iii/

with cte as (
    select
        *
         , rank() over(partition by product_id order by year asc) as rn
    from Sales
)

select
    product_id
     , year as first_year
     , quantity
     , price
from cte
where rn = 1;