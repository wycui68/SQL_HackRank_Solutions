select if(Grade < 8, Null, name) as name, 
Grade, Marks
from Students t1 join Grades t2
on Marks between Min_Mark and Max_Mark
order by grade desc, name
