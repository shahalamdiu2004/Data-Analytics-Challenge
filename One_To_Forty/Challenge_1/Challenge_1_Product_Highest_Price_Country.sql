SELECT * FROM suppliers;

with c1 as (SELECT 
p.*,
s.country,
dense_rank() over (partition by s.country order by p.price desc) as rn
FROM products as p
left join suppliers as s
on p.supplier_id= s.supplier_id)

select 
product_name,
price,
country
from c1
where rn =1;


