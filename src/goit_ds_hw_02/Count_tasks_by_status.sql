-- Отримати кількість завдань для кожного статусу. Використайте SELECT, COUNT, GROUP BY для групування завдань за статусами.
SELECT s.name AS status,
COUNT(status_id) AS count_tasks
FROM tasks t
LEFT JOIN status s ON s.id = t.status_id 
GROUP BY s.id, s.name