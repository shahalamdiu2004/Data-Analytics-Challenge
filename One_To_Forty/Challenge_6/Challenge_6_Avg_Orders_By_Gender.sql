select * from customers_1;
select 
c.gender,
round (avg (total_amount),2) as avg_orders
from orders as o
left join customers_1 as c
on o.customer_id=c.customer_id
group by c.gender