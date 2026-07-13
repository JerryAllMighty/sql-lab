-- https://leetcode.com/problems/customers-who-bought-all-products/description/
with cte as (
    select
        customer_id
         , count(distinct product_key) as cnt
    from customer c
    group by customer_id
)

select
    customer_id
from cte
where cnt = (
    select
        count(product_key)
    from Product
)
