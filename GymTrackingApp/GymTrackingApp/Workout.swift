//
//  Workout.swift
//  GymTrackingApp
//
//  Created by Aarav on 12/6/24.
//

struct ExerciseModel: Codable {
    let exercises: [Workout]
    
    
}


struct Workout : Codable {
    let id: Int
    let userId: Int
    let exerciseName: String
    let exerciseType: String
    let exerciseWeight: Double?
    let exerciseDate: String
    let exerciseSets: Int
    let exerciseReps: Int
}

