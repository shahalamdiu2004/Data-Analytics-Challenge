SELECT * FROM customers;
select * from transaction;

SELECT 
c.customer_name,
sum (amount) as total_amount
FROM transaction as t
left join customers as c
on c.customer_id=t.customer_id
where extract (year from transaction_date)= 
(select max (extract (year from transaction_date)) from transaction)
group by 1;


