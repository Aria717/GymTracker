from db import DatabaseDriver
from flask import Flask, request, jsonify

app = Flask(__name__)

db = DatabaseDriver()

def success_response(data, code=200):
    return jsonify(data), code

def failure_response(message, code=404):
    return jsonify({"error": message}), code


@app.route("/api/users/", methods=["GET"])
def get_users():
    """
    Get all users.
    """
    users = db.get_all_users()
    return success_response({"users": users}, 201)


@app.route("/api/users/<int:user_id>/", methods=["GET"])
def get_user_by_id(user_id):
    """
    Get a user by their ID.
    """
    user = db.get_user_by_id(user_id)
    if not user:
        return failure_response("User not found.")
    return success_response(user, 201)


@app.route("/api/users/", methods=["POST"])
def add_user():
    """
    Add a new user.
    """
    body = request.json
    name = body.get("name")
    age = body.get("age")
    height = body.get("height")
    weight = body.get("weight")

    if not all([name, age, height, weight]):
        return failure_response("Missing required fields.", 400)
    
    user_id = db.insert_user(name, age, height, weight)
    body["id"] = user_id  # Add the generated user ID to the response body
    return success_response(body, 201)


@app.route("/api/users/<int:user_id>/", methods=["DELETE"])
def delete_user(user_id):
    """
    Delete a user by their ID.
    """
    user = db.get_user_by_id(user_id)
    if not user:
        return failure_response("User not found.")
    
    db.delete_user_by_id(user_id)
    return success_response(user, 201)


@app.route("/api/exercises/", methods=["POST"])
def add_exercise():
    """
    Add a new exercise.
    """
    body = request.json
    user_id = body.get("user_id")
    exercise_name = body.get("exercise_name")
    exercise_type = body.get("exercise_type")
    exercise_weight = body.get("exercise_weight")
    exercise_date = body.get("exercise_date")
    exercise_sets = body.get("exercise_sets")
    exercise_reps = body.get("exercise_reps")

    if not all([user_id, exercise_name, exercise_type, exercise_weight, exercise_date, exercise_sets, exercise_reps]):
        return failure_response("Missing required fields.", 400)

    exercise_id = db.insert_exercise(
        user_id, exercise_name, exercise_type, exercise_weight,
        exercise_date, exercise_sets, exercise_reps
    )
    body["id"] = exercise_id  # Add the generated exercise ID to the response body
    return success_response(body, 201)


@app.route("/api/exercises/user/<int:user_id>/", methods=["GET"])
def get_exercises_by_user_id(user_id):
    """
    Get all exercises for a specific user.
    """
    exercises = db.get_exercises_by_user_id(user_id)
    if not exercises:
        return failure_response("No exercises found for this user.")
    return success_response({"exercises": exercises}, 201)


@app.route("/api/exercises/<int:exercise_id>/", methods=["DELETE"])
def delete_exercise(exercise_id):
    """
    Delete an exercise by its ID.
    """
    db.delete_exercise_by_id(exercise_id)
    return success_response({"id": exercise_id}, 201)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
