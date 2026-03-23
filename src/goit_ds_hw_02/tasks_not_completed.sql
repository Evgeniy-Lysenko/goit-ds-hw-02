-- Запит повертає всі завдання, які ще не завершено
SELECT t.id,
       t.title,
       t.description,
       s.name AS status
FROM tasks t 
JOIN status s ON s.id = t.status_id
	WHERE status != 'completed'

