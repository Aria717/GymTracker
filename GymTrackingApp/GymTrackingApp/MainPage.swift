//
//  MainPage.swift
//  GymTrackingApp
//
//  Created by Aarav on 12/6/24.
//

import SwiftUI
import UIKit

struct MainPage : View {
    
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
                    workout
                    workout
                    workout
                    workout
                    workout
                    workout
                }
                .scrollIndicators(.hidden)
                
                Spacer()
            }
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
