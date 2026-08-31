select * from product_revenue;

with c1 as (select 
product_name,
sum(case when year =2022 then revenue else 0 end) as revenue_2022,
sum(case when year =2023 then revenue else 0 end) as revenue_2023
from product_revenue
group by 1
order by 1)

select *,
revenue_2023 - revenue_2022 as revenue_diff,
round (100.0 * (revenue_2023/revenue_2022 -1), 2) || '%' as revenue_ratio
from c1
where (revenue_2023 - revenue_2022)<0
order by revenue_diff asc
limit 5;

with c1 as (select *,
lag (revenue) over (partition by product_name order by year) as pre_revenue
from product_revenue)

select * from c1
where pre_revenue is not null



