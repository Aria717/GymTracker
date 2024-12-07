//
//  MainPage.swift
//  GymTrackingApp
//
//  Created by Aarav on 12/6/24.
//

import SwiftUI
import UIKit

struct MainPage : View {
    @State var workouts: [Workout] = []
    
    func getWorkouts() {
        NetworkManager.shared.getAllWorkouts(userId: 1) { exercises in
            self.workouts = exercises
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Text("Welcome . . .")
                .font(.largeTitle)
                .padding(.bottom, 50)
            
            Spacer()
            
            VStack {
                HStack {
                    NavigationLink {
                        AddWorkoutPage()
                    } label: {
                        addWorkoutButton
                    }
                    
                    addWorkoutText
                    Spacer()
                }
                .padding(.leading, 50)
                .padding(.bottom, 20)
                
                
                prevWorkouts
                
                ScrollView {
                    let workoutEg = Workout(id: 0, userId: 1, exerciseName: "Push ups", exerciseType: "Arms", exerciseWeight: 0, exerciseDate: "12/6/24", exerciseSets: 3, exerciseReps: 30)
                    showWorkout(workout: workoutEg)
                    
                    ForEach(self.workouts, id: \.id) { workout in
                        showWorkout(workout: workout)
                    }
                    
                    //workout
                    //workout
                    //workout
                    //workout
                    //workout
                }
                .scrollIndicators(.hidden)
                
                Spacer()
            }
        }
        .onAppear {
            getWorkouts()
            print(self.workouts)
        }
    }
    
    private var addWorkoutButton : some View {
        Image(systemName: "plus")
            .resizable()
            .scaledToFit()
            .frame(width: 15, height: 15)
            .padding(10)
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(.circle)
    }
    
    private var addWorkoutText : some View {
        Text("Add new workout")
    }
    
    private var prevWorkouts : some View {
        Text("Previous Workouts")
            .font(.headline)
            .padding(.bottom, 20)
    }
    
    private func showWorkout(workout: Workout) -> some View {
        VStack {
            HStack {
                Text(workout.exerciseName)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                Text("Type: \(workout.exerciseType)")
            }
            
            HStack {
                Text("Num Sets: \(workout.exerciseSets)")
                Text("Num Reps: \(workout.exerciseReps)")
            }
            
            Text("Date: \(workout.exerciseDate)")
                .font(.caption)
        }
        .padding()
        .cornerRadius(10)
        .frame(width: 300, height: 150)
        .border(.black, width: 2)
    }
    
    
    private var workout : some View {
        VStack {
            Text("Workout Name")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .shadow(radius: 5)
            HStack {
                Text("Num Reps")
                    .padding()
                Text("Num Calories")
            }
        }
        .padding()
        .cornerRadius(10)
        .frame(width: 300, height: 150)
        .border(Color.black, width: 2)
    }
    
    
    
    
}

#Preview {
    MainPage()
}
