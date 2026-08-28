select 
p.*,
l.page_id
from pages as p
left join page_likes as l
on p.page_id=l.page_id
where l.page_id is null;

select 
p.page_id,
l.page_id
from pages as p
left join page_likes as l
on p.page_id=l.page_id
where l.page_id is null;

select 
p.page_id
from pages as p
left join page_likes as l
on p.page_id=l.page_id
where l.page_id is null
order by p.page_id;
