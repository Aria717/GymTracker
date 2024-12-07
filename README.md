# GymTracker
Own the grind, Track the Rise!!

# Gym Tracking App Frontend

This Gym Tracking App has three main pages that allow users to manage their workouts. The app's primary features include logging workouts and viewing previous workouts.

## Pages

### 1. **Home Page**
   - **Login**: Users can enter username and password to log in.
   - **Create Account**: New users can attempt to create an account by filling out a registration form.
   - **Guest Login**: Users can log in as a guest without creating an account.

   The home page provides users with an easy entry point to start using the app.

   **Screenshot**:
   ![Home Page](https://github.com/user-attachments/assets/b340384e-627e-4d56-8103-0d16fccf389a)

### 2. **User Main Page**
   - **Add Workout Button**: Users can tap this button to navigate to the Add Workouts page where they can log new exercises.
   - **Previous Workouts**: A list of all past workouts is displayed on the page. This section allows users to view their workout history.

   The User Main Page is the central hub for managing workouts and seeing workout history.

   **Screenshot**:
   ![User Main Page](https://github.com/user-attachments/assets/1c099fdf-530d-49d3-8b23-8d472f2c6c78)

### 3. **Add Workouts Page**
   - **Workout Fields**: Users can fill in details about the workout they wish to log, such as:
     - **Exercise Name**
     - **Exercise Type**
     - **Weight**
     - **Sets**
     - **Reps**
     - **Date**
   - **Submit Button**: After filling out the form, users can submit their workout to be saved.

   The Add Workouts page is designed to allow users to easily log new workouts and exercises.

   **Screenshot**:
   ![Add Workouts Page](https://github.com/user-attachments/assets/ece5b051-fa53-48ef-9161-2848ba65d7de)

## Features

- **User Authentication**: Users can log in as guest without an account.
- **Add New Workouts**: Users can specify details like the exercise type, weight, and date of new workouts.
- **View Previous Workouts**: A history of workouts is available on the main user page, allowing users to review their past entries.



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


