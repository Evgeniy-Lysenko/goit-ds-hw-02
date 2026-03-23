-- Отримати список завдань, що не мають опису
SELECT * FROM tasks t 
WHERE t.description IS NULL
      OR t.description = '';