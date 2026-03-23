-- Отримати завдання, які призначені користувачам з певною доменною частиною електронної пошти.
SELECT u.fullname,
	   u.email,
       t.title,
       t.description
FROM tasks t 
JOIN users u ON u.id = t.user_id 
WHERE u.email LIKE '%@example.com'