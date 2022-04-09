select concat(Name, '(', left(Occupation,1), ')') as Occ
from OCCUPATIONS
order by Occ;

select concat('There are a total of ', count(*), ' ',lower(Occupation), 's.')
from OCCUPATIONS
group by Occupation
order by count(*), Occupation;
