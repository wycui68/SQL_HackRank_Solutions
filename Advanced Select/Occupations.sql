with cte as 
( 
    select RANK() OVER (PARTITION BY Occupation ORDER BY Name) as row_num, 
    case when Occupation='Doctor' then Name else null end as doctor, 
    case when Occupation='Professor' then Name else null end as prof, 
    case when Occupation='Singer' then Name else null end as singer, 
    case when Occupation='Actor' then Name else null end as actor 
    from Occupations) 

select min(doctor), min(prof), min(singer), min(actor)
from cte
group by row_num
