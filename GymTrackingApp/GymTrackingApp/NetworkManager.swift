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
    
    private let endpoint = ""
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
    func saveWorkout(id: Int, name: String, type: String, weight: Int, date: String, numSets: Int, numReps: Int, completion: @escaping (Workout) -> Void) {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let endpoint = self.endpoint + "/api/exercises/"
        
        let parameters: Parameters = [
            "user_id": id,
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
        
        
        /*
         user_id = body.get("user_id")
         exercise_name = body.get("exercise_name")
         exercise_type = body.get("exercise_type")
         exercise_weight = body.get("exercise_weight")
         exercise_date = body.get("exercise_date")
         exercise_sets = body.get("exercise_sets")
         exercise_reps = body.get("exercise_reps")
         */
    }
    
    
    
}
