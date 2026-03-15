import sqlite3
from pathlib import Path

# use pathlib to get the directory of the current script
base_dir = Path(__file__).parent

sql_path = base_dir / "create_table.sql"
db_path = base_dir / "user_tasks.db"

def create_db():
      # read the SQL script from the file for creating the database
      with open(sql_path, "r") as f:
        sql = f.read()

      # create a connection to the database (if the database file doesn't exist, it will be created)
      with sqlite3.connect(db_path) as con:
        cur = con.cursor()
        # execute the SQL script
        cur.executescript(sql)

def main():
  create_db()
  print("Database created")

if __name__ == "__main__":
  main()
