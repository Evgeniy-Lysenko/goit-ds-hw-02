-- Отримати список користувачів, які не мають жодного завдання. Використайте комбінацію SELECT, WHERE NOT IN і підзапит.
SELECT u.id, u.fullname, u.email
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
WHERE t.id IS NULL;