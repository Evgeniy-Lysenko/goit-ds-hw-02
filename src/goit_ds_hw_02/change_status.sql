-- Оновити статус конкретного завдання. Змініть статус конкретного завдання на 'in progress' або інший статус
UPDATE "tasks"
SET "status_id" = (
  SELECT "id" FROM "status" WHERE "name" = 'in progress'
)
WHERE "id" = 8;
-- Приклад зі значеннями:
-- - :task_id = 42
-- - :status_name = 'in progress'