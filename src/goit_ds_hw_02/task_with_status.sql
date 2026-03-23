-- Вибрати завдання за певним статусом. Використайте підзапит для вибору завдань з конкретним статусом, наприклад, 'new'.
SELECT t.id,
       t.title,
       t.description,
       t.status_id,
       t.user_id,
       u.fullname AS user_fullname
FROM tasks t
LEFT JOIN users u ON u.id = t.user_id
WHERE t.status_id IN (
  SELECT s.id
  FROM status s
  WHERE s.name = 'new'
);