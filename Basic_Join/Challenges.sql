SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS c_cnt
FROM Hackers h JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING c_cnt = (SELECT MAX(t1.cnt) AS max_cnt
                   FROM 
                        (
                            SELECT COUNT(*) cnt
                            FROM Challenges
                            GROUP BY hacker_id
                            ORDER BY hacker_id
                         ) t1

                    )

OR c_cnt IN 
(
SELECT t2.cnt
FROM 
(
    SELECT hacker_id, COUNT(*) AS cnt
    FROM Challenges
    GROUP BY hacker_id
) t2
GROUP BY t2.cnt
HAVING COUNT(t2.cnt) = 1
)

ORDER BY c_cnt DESC, h.hacker_id; 

# Filter the max_cnt challenge number
# Filter the challenge number = 1
