-- Додати нове завдання для конкретного користувача
-- вкажіьть email, tite, description.
INSERT INTO "tasks" ("title", "description", "status_id", "user_id")
SELECT
  'тестове завдання', -- tite
  'Тестовий description для тествого завдання', -- description
  (SELECT "id" FROM "status" WHERE "name" = 'new' LIMIT 1),
  "id"
FROM "users"
WHERE "email" = 'michael32@example.com' -- email
LIMIT 1;