select 
max (case when department ='Marketing' then salary end) as marketing_max_salary,
max (case when department ='Engineering' then salary end) engineering_max_salary,
abs (max(case when department ='Marketing' then salary end) - 
max (case when department ='Engineering' then salary end)) as salary_diff
from salaries;

with c1 as (select 
department,
salary,
row_number() over (partition by department order by salary desc)
from salaries)

select 
abs (max (case when department = 'Marketing' and row_number =1 then salary end)-
max (case when department = 'Engineering' and row_number =1 then salary end)) as salary_diff
from c1
