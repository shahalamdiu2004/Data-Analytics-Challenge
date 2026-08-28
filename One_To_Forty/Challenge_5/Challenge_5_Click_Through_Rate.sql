select 
app_id,
sum(case when event_type ='impression' then 1 else 0 end) as impression_no,
sum(case when event_type ='click' then 1 else 0 end) as click_no,
count (*) as total_impression,
round (100.0* sum(case when event_type ='click' then 1 else 0 end)/
count(*),2) as ctr
from events
group by app_id;



