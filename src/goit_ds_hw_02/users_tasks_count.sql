--Отримати користувачів та кількість їхніх завдань
SELECT u.fullname,
COUNT(t.user_id) AS tasks_count
FROM users u 
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.fullname