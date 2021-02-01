SELECT h.hacker_id, 
       h.name, 
       SUM(max_score) AS score
FROM Hackers h JOIN 
(
SELECT hacker_id, MAX(score) AS max_score
FROM Submissions 
GROUP BY hacker_id, challenge_id
) t ON h.hacker_id = t.hacker_id 
GROUP BY h.hacker_id, h.name
HAVING score > 0 
ORDER BY score DESC, h.hacker_id; 
