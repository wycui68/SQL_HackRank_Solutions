/* for each hacker_id and challenge_id, calculate the max score*/
select t1.hacker_id, t1.name, sum(max_score) as score
from Hackers t1 left join 
    (
        select hacker_id, max(score) as max_score
        from Submissions
        group by hacker_id, challenge_id
    ) t2 
on t1.hacker_id = t2.hacker_id
group by t1.hacker_id, t1.name
having score > 0 
order by score desc, t1.hacker_id;
