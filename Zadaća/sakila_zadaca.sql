

select distinct a.country,b.city,c.address2
from country a inner join city b on a.country_id=b.country_id
inner join address c on b.city_id=c.city_id 
where c.address2 is null;
