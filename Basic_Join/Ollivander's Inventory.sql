SELECT w0.id, p.age, w0.coins_needed, w0.power
FROM Wands w0 JOIN 
(
    SELECT code, MIN(coins_needed) AS min_coins, power
    FROM Wands
    GROUP BY code, power
) w ON w0.code = w.code AND w0.coins_needed = w.min_coins AND w0.power = w.power
JOIN Wands_Property p ON p.code = w0.code AND p.is_evil = 0
ORDER BY w0.power DESC, p.age DESC; 


# Find out the minimal coins needed for each power
# Join with the Wands_property under the condition that is_evil = 0
