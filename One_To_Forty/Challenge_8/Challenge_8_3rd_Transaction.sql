with c1 as (select *,
row_number() over (partition by user_id order by transaction_date)
from transactions)

select user_id, spend, transaction_date from c1
where row_number % 3=0;

