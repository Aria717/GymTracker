//
//  SecondScreen.swift
//  GymTrackingApp
//
//  Created by Aarav on 12/6/24.
//

import SwiftUI
import UIKit

struct CreateAccountPage: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                nameField
                ageField
                heightField
                weightField
                
                createButton
                
            }
            .navigationTitle("Create New User")
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
    
    private var ageField : some View {
        TextField("Age", text: $age)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var heightField : some View {
        TextField("Height (in inches)", text: $height)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var weightField : some View {
        TextField("Weight (in pounds)", text: $weight)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
            )
            .padding(.bottom, 10)
            .padding([.leading, .trailing], 20)
    }
    
    private var createButton : some View {
        Button {
            
            if let ageInt = Int(age), let heightInt = Int(height), let weightInt = Int(weight) {
                NetworkManager.shared.addUser(name: name, age: ageInt, heightInInches: heightInt, weightInPounds: weightInt) { user in
                    
                }
                
                name = "Name"
                age = "Age"
                height = "Height (in inches)"
                weight = "Weight (in pounds)"
                
            }
            else {
                print("failed to create user")
            }
            
            
        } label: {
            Text("Create")
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        
        
    }
    
}

#Preview {
    CreateAccountPage()
}
