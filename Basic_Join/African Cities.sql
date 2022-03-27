select t1.name
from CITY t1 join COUNTRY t2
on t1.COUNTRYCODE = t2.CODE
where CONTINENT = 'Africa'
