# GymTracker
Application to track your progress in the gym. 

# Backend Features

This backend provides RESTful APIs for managing users and their exercises in a gym tracking application. Below are the key features implemented:

---

## Routes

### User Management
- *GET /api/users/*  
  Fetches all users from the database.

- *GET /api/users/<int:user_id>/*  
  Retrieves details of a specific user by their ID.

- *POST /api/users/*  
  Creates a new user with required fields: name, age, height, and weight.

- *DELETE /api/users/<int:user_id>/*  
  Deletes a user by their ID and all related exercises.

### Exercise Management
- *POST /api/exercises/*  
  Adds a new exercise for a user. Requires fields like user_id, exercise_name, exercise_type, exercise_date, exercise_sets, exercise_reps, and optionally exercise_weight.

- *GET /api/exercises/user/<int:user_id>/*  
  Fetches all exercises associated with a specific user.

- *DELETE /api/exercises/<int:exercise_id>/*  
  Deletes an exercise by its ID.

---

## Database Models

### Users Table
- *id*: Unique identifier for each user (Primary Key).  
- *name*: Name of the user (Text, required).  
- *age*: Age of the user (Integer, required).  
- *height*: Height of the user in centimeters (Real, required).  
- *weight*: Weight of the user in kilograms (Real, required).  

### Exercises Table
- *id*: Unique identifier for each exercise (Primary Key).  
- *user_id*: Foreign key linking the exercise to a user (required, cascades on delete).  
- *exercise_name*: Name of the exercise (Text, required).  
- *exercise_type*: Type of exercise (e.g., Strength, Cardio) (Text, required).  
- *exercise_weight*: Weight used for the exercise in kilograms (Real, optional).  
- *exercise_date*: Date of the exercise (Text, required).  
- *exercise_sets*: Number of sets performed (Integer, required).  
- *exercise_reps*: Number of reps per set (Integer, required).  

---

## Features

### Database
- Uses *SQLite* as the database.
- Tables: users and exercises.
- Designed to maintain relational integrity (e.g., cascading delete for user_id in exercises).

### Singleton Database Driver
- Implements a singleton pattern to ensure only one instance of the database driver is created during the app's runtime.
- Efficiently handles all CRUD operations for the users and exercises tables.

### Error Handling
- Provides consistent responses for missing or invalid data:
  - *404*: Not Found.
  - *400*: Bad Request.

### Frameworks and Libraries
- *Flask*: Lightweight framework for REST API development.
- *SQLite*: Simple and efficient database management system.


