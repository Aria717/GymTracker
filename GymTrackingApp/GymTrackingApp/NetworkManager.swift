//
//  NetworkManager.swift
//  GymTrackingApp
//
//  Created by Aarav on 11/28/24.
//

import Alamofire
import Foundation

public class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    private let endpoint = "http://34.86.107.209"
    private let decoder = JSONDecoder()
    
    //MARK: add user
    func addUser(name: String, age: Int, heightInInches: Int, weightInPounds: Int, completion: @escaping (User) -> Void) {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let endpoint = self.endpoint + "/api/users/"
        
        let parameters: Parameters = [
            "name": name,
            "age": age,
            "height": heightInInches,
            "weight": weightInPounds
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    print("Successfully added \(user.name)")
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.addUser \(error.localizedDescription)")
                }
            }
    }
    
    //MARK: get all users
    func getAllUsers(completion: @escaping([User]) -> Void) {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let endpoint = self.endpoint + "/api/users/"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [User].self, decoder: decoder) { response in
                switch response.result {
                case .success(let userList):
                    print("Successfully got user list")
                    completion(userList)
                case .failure(let error):
                    print("Error in NetworkManager.getAllUsers \(error.localizedDescription)")
                }
            }
    }
    
    
    //MARK: save workout
    func saveWorkout(userId: Int, name: String, type: String, weight: Int, date: String, numSets: Int, numReps: Int, completion: @escaping (Workout) -> Void) {
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        let endpoint = self.endpoint + "/api/exercises/"
        
        let parameters: Parameters = [
            "user_id": userId,
            "exercise_name": name,
            "exercise_type": type,
            "exercise_weight": weight,
            "exercise_date": date,
            "exercise_sets": numSets,
            "exercise_reps": numReps
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Workout.self, decoder: decoder) { response in
                switch response.result {
                case .success(let workout):
                    print("Successfully added workout")
                    completion(workout)
                case .failure(let error):
                    print("Error in NetworkManager.saveWorkout \(error.localizedDescription)")
                }
            }
    }
    
    //MARK: get all workouts
    func getAllWorkouts(userId: Int, completion: @escaping ([Workout]) -> Void) {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let endpoint = self.endpoint + "/api/exercises/user/\(userId)/"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseData { response in
                        switch response.result {
                        case .success(let data):
                            // Log the raw response data
                            if let jsonString = String(data: data, encoding: .utf8) {
                                print("Raw response data: \(jsonString)")  // Log the raw response data
                            }

                            do {
                                // Try to decode the response into the expected format
                                let workoutResponse = try self.decoder.decode(ExerciseModel.self, from: data)
                                print("Successfully got workout list of size \(workoutResponse.exercises.count)")
                                completion(workoutResponse.exercises)
                            } catch {
                                print("Error decoding response: \(error.localizedDescription)")
                            }

                        case .failure(let error):
                            print("Error in NetworkManager.getAllWorkouts: \(error.localizedDescription)")
                        }
                    }
//            .responseDecodable(of: ExerciseModel.self, decoder: decoder) { response in
//                switch response.result {
//                case .success(let exerciseResponse):
//                    print("Successfully got workout list of size \(exerciseResponse.exercises.count)")
//                    completion(exerciseResponse.exercises)
//                case .failure(let error):
//                    print("Error in NetworkManager.getAllWorkouts \(error.localizedDescription)")
//                }
//            }
    }
    
    
    
}
