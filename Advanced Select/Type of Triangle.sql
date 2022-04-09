select case when not (A + B > C and A + C > B and B + C > A) then 'Not A Triangle'
when A = B and B = C and A = C then 'Equilateral'
            when A = B or B = C or A = C then 'Isosceles'
            
            else 'Scalene' end
from TRIANGLES
