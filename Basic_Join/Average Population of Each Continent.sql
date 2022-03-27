select CONTINENT, 
floor(avg(t1.POPULATION))
from CITY t1 join COUNTRY t2
on t1.COUNTRYCODE = t2.CODE
group by CONTINENT
