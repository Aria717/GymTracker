import sqlite3

# Singleton decorator to ensure only one instance of the database exists
def singleton(cls):
    instances = {}

    def get_instance():
        if cls not in instances:
            instances[cls] = cls()
        return instances[cls]

    return get_instance


@singleton
class DatabaseDriver:
    """
    Database driver for the gym tracking app.
    Handles all interactions with the database.
    """

    def __init__(self):
        # Connect to SQLite database
        self.conn = sqlite3.connect("gym_tracking.db", check_same_thread=False)
        self.conn.row_factory = sqlite3.Row  # Enable dictionary-style row access
        self.create_user_table()
        self.create_exercise_table()

    def create_user_table(self):
        """
        Create the `users` table.
        """
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                age INTEGER NOT NULL,
                height REAL NOT NULL,
                weight REAL NOT NULL
            );
        """)

    def create_exercise_table(self):
        """
        Create the `exercises` table.
        """
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS exercises (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                exercise_name TEXT NOT NULL,
                exercise_type TEXT NOT NULL,
                exercise_weight REAL,
                exercise_date TEXT NOT NULL,
                exercise_sets INTEGER NOT NULL,
                exercise_reps INTEGER NOT NULL,
                FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
            );
        """)

    def get_all_users(self):
        """
        Return all users in the `users` table.
        """
        cursor = self.conn.execute("SELECT * FROM users;")
        users = [dict(row) for row in cursor]
        return users

    def get_user_by_id(self, user_id):
        """
        Get a user by ID from the `users` table.
        """
        cursor = self.conn.execute("SELECT * FROM users WHERE id = ?;", (user_id,))
        row = cursor.fetchone()
        return dict(row) if row else None

    def insert_user(self, name, age, height, weight):
        """
        Insert a new user into the `users` table.
        """
        cursor = self.conn.cursor()
        cursor.execute(
            "INSERT INTO users (name, age, height, weight) VALUES (?, ?, ?, ?);",
            (name, age, height, weight)
        )
        self.conn.commit()
        return cursor.lastrowid

    def delete_user_by_id(self, user_id):
        """
        Delete a user by ID from the `users` table.
        """
        self.conn.execute("DELETE FROM users WHERE id = ?;", (user_id,))
        self.conn.commit()

    def insert_exercise(self, user_id, exercise_name, exercise_type, exercise_weight, exercise_date, exercise_sets, exercise_reps):
        """
        Insert a new exercise into the `exercises` table.
        """
        cursor = self.conn.cursor()
        cursor.execute(
            """
            INSERT INTO exercises (
                user_id, exercise_name, exercise_type, exercise_weight, exercise_date, exercise_sets, exercise_reps
            ) VALUES (?, ?, ?, ?, ?, ?, ?);
            """,
            (user_id, exercise_name, exercise_type, exercise_weight, exercise_date, exercise_sets, exercise_reps)
        )
        self.conn.commit()
        return cursor.lastrowid

    def get_exercises_by_user_id(self, user_id):
        """
        Get all exercises for a specific user.
        """
        cursor = self.conn.execute("SELECT * FROM exercises WHERE user_id = ?;", (user_id,))
        exercises = [dict(row) for row in cursor]
        return exercises

    def delete_exercise_by_id(self, exercise_id):
        """
        Delete an exercise by ID from the `exercises` table.
        """
        self.conn.execute("DELETE FROM exercises WHERE id = ?;", (exercise_id,))
        self.conn.commit()
