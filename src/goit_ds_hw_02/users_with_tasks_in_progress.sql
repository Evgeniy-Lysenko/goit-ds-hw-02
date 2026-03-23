-- Вибрати користувачів та їхні завдання, які є у статусі 'in progress'.
SELECT u.fullname,
	   t.title,
	   s.name AS status
FROM tasks t 
JOIN users u ON u.id = t.user_id 
JOIN status s ON s.id = t.status_id 
WHERE s.name = 'in progress'
ORDER BY u.fullname;