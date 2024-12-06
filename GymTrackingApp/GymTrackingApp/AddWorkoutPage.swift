//
//  AddWorkoutPage.swift
//  GymTrackingApp
//
//  Created by Aarav on 12/6/24.
//

import SwiftUI
import UIKit

struct AddWorkoutPage : View {
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var weight: String = ""
    @State private var date: String = ""
    @State private var numSets: String = ""
    @State private var numReps: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                nameField
                typeField
                weightField
                dateField
                numSetsField
                numRepsField
                
                saveButton
            }
            .navigationTitle("Save New Workout")
        }
        
    }
    
    private var nameField : some View {
        TextField("Name", text:$name)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var typeField : some View {
        TextField("Type", text: $type)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var weightField : some View {
        TextField("Weight", text: $weight)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var dateField : some View {
        TextField("Date", text: $date)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var numSetsField : some View {
        TextField("Number of Sets", text: $numSets)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var numRepsField : some View {
        TextField("Number of Reps", text: $numReps)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var saveButton : some View {
        Button {
            
            if let intWeight = Int(weight), let setCount = Int(numSets), let repCount = Int(numReps)  {
                NetworkManager.shared.saveWorkout(id: ContentView.userId, name: name, type: type, weight: intWeight, date: date, numSets: setCount, numReps: repCount) { workout in
                    
                }
                
                name = "Name"
                type = "Type"
                weight = "Weight"
                date = "Date"
                numSets = "Number of Sets"
                numReps = "Reps"
                
                
            }
            else {
                print("failed to save workout")
            }
            
            
        } label: {
            Text("Save")
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        
        
    }
}

#Preview {
    AddWorkoutPage()
}
