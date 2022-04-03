# version as April, 2022
select h.hacker_id, h.name
from 
    (
        select s.hacker_id, count(distinct s.challenge_id) as cnt
        from Submissions s left join Challenges c
        on s.challenge_id = c.challenge_id 
        left join Difficulty d on c.difficulty_level = d.difficulty_level
        where s.score = d.score
        group by s.hacker_id
        having count(distinct s.challenge_id) > 1
    ) cet left join Hackers h 
on cet.hacker_id = h.hacker_id
order by cnt desc, cet.hacker_id


############## version of 2021################

SELECT t4.hacker_id, t4.name
FROM 
(
    SELECT t1.hacker_id, COUNT(DISTINCT t1.challenge_id) AS cnt
    FROM Submissions t1 JOIN Challenges t2 JOIN Difficulty t3
    ON t1.challenge_id = t2.challenge_id AND t2.difficulty_level = t3.difficulty_level
    WHERE t1.score = t3.score
    GROUP BY t1.hacker_id
    HAVING COUNT(DISTINCT t1.challenge_id) > 1
) tmp JOIN Hackers t4 ON tmp.hacker_id = t4.hacker_id
ORDER BY cnt DESC, t4.hacker_id;

# Through Inner Join, find out the hacker_id that achieves the max score for that level.
# Using Inner Join, find out the names with the hacker_id


