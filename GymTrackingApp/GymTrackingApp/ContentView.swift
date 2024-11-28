//
//  ContentView.swift
//  GymTrackingApp
//
//  Created by Aarav on 11/28/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Your Gym Tracker")
                .bold()
                .padding(50)
            
            VStack {
                Group {
                    Text("Username")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    TextField("Enter Username Here", text: $username)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 1)
                        )
                        .padding(.bottom, 30)
                } // end username group
                Group {
                    Text("Password")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    TextField("Enter Password Here", text: $password)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 1)
                        )
                } // end password group
            } // end username-password vstack
            .padding([.leading, .trailing], 20)
            
            Button {
                
            } label: {
                Text("Log In")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            } // end button
            
        } // end main Vstack
    } // end body
} // end contentview

#Preview {
    ContentView()
}
