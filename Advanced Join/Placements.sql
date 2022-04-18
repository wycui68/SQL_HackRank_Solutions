select Name
from 
    (
        select f.ID, p2.Salary 
        from Friends f left join Packages p1
        on f.ID = p1.ID 
        left join Packages p2 
        on f.Friend_ID = p2.ID
        where p2.Salary > p1.Salary 
    ) t left join Students s
    on t.ID = s.ID
order by Salary 
