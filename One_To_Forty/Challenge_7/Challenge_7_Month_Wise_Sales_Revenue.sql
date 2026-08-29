select 
to_char(order_date, 'Mon') as month_,
sum (price_per_unit * quantity) as total_sales
from sales
where extract (year from order_date)='2023'
group by 1
order by extract (month from min(order_date));

