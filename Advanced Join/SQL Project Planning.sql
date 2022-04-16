select Start_Date, min(End_Date)
from 
(
    (select Start_Date
    from Projects
    where Start_Date not in 
        (
            select End_Date
            from Projects
        )) t1, 
    (select End_Date
    from Projects
    where End_Date not in 
        (
            select Start_Date
            from Projects
        )) t2
)
where Start_Date < End_Date
group by Start_Date
order by min(End_Date)-Start_Date, Start_Date

