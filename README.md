# Система керування завданнями (SQLite + Python)
Невеликий навчальний проєкт для роботи з базою даних SQLite із використанням Python та бібліотеки Faker.
Реалізовано просту систему керування завданнями з користувачами та статусами.

## Стек технологій
Python 3.12+
SQLite
Poetry
Faker

## Структура проєкту

```
project-root/ 
│
├── src/goit_ds_hw_02/ 
│           ├── create_db.py # створення БД та таблиць 
│           ├── seed.py # заповнення тестовими даними 
│           ├── help.py # підказки щодо запуску 
│           ├── create_table.sql # SQL-скрипт створення таблиць 
│           └── user_tasks.db # файл бази даних (створюється автоматично) 
│ 
├── poetry.lock
├── pyproject.toml 
└── README.md
```

## Встановлення та запуск
### Встановлення залежностей
```
poetry install
```
### Створення бази даних
```
poetry run create_db
```
### Заповнення тестовими даними
```
poetry run seed
```
### Підказка щодо команд
```
poetry run help
```

## Структура бази даних
### Таблиця users
id — первинний ключ
fullname — повне ім’я користувача
email — унікальна електронна адреса

### Таблиця status
id — первинний ключ
name — унікальна назва статусу

Попередньо заповнені значення:

new
in progress
completed

### Таблиця tasks
id — первинний ключ
title — назва завдання
description — опис
status_id — зовнішній ключ (status)
user_id — зовнішній ключ (users)

### Зв’язки
Один користувач → багато завдань
Один статус → багато завдань
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
FOREIGN KEY (status_id) REFERENCES status(id)

При видаленні користувача всі його завдання автоматично видаляються.

## Приклади SQL-запитів
📌 Усі завдання користувача
SELECT * FROM tasks WHERE user_id = 1;

📌 Завдання зі статусом "new"
SELECT t.*
FROM tasks t
JOIN status s ON s.id = t.status_id
WHERE s.name = 'new';

📌 Користувачі без завдань
SELECT u.*
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
WHERE t.id IS NULL;

📌 Кількість завдань по користувачах
SELECT u.fullname, COUNT(t.id) AS tasks_count
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id, u.fullname;

📌 Завдання без опису
SELECT *
FROM tasks
WHERE description IS NULL OR description = '';

## ⚠️ Важливе зауваження (SQLite)

Для коректної роботи зовнішніх ключів необхідно увімкнути:

con.execute("PRAGMA foreign_keys = ON;")

Без цього:

не працює ON DELETE CASCADE
ігноруються обмеження зовнішніх ключів

## 🎯 Мета проєкту
Практика роботи з SQL (JOIN, GROUP BY, підзапити)
Робота з SQLite через Python (PEP 249)
Використання Faker для генерації даних
Організація проєкту через Poetry

