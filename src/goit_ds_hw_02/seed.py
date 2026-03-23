import faker
from random import randint, choice
import sqlite3
from pathlib import Path

base_dir = Path(__file__).parent

db_path = base_dir / "user_tasks.db"

NUMBER_USERS = 10
NUMBER_TASKS = 30

def generate_fake_data(number_users, number_tasks) -> tuple():
    fake_users = []  # users - tuple(name, email)
    fake_tasks = []  # tasks - tuple(title, description, status_id, user_id)
    fake_data = faker.Faker()

    for _ in range(number_users):
      fullname = fake_data.name()
      email = fake_data.unique.email()
      fake_users.append((fullname, email))

    for _ in range(number_tasks):
      title = fake_data.sentence(nb_words=4)
      description = fake_data.text(max_nb_chars=200)
      status_id = randint(1, 3)  # assuming we have 3 statuses
      user_id = randint(1, number_users)  # assign task to a random user
      fake_tasks.append((title, description, status_id, user_id))

    return fake_users, fake_tasks

def insert_data_to_db(users, tasks):
      with sqlite3.connect(db_path) as con:
            cur = con.cursor()
            # Insert users
            cur.executemany("INSERT INTO users (fullname, email) VALUES (?, ?);", users)
            # Insert tasks
            cur.executemany("INSERT INTO tasks (title, description, status_id, user_id) VALUES (?, ?, ?, ?);", tasks)
            con.commit()

def main():
  users, tasks = generate_fake_data(NUMBER_USERS, NUMBER_TASKS)
  insert_data_to_db(users, tasks)
  print("Data inserted into database")

if __name__ == "__main__":  main()