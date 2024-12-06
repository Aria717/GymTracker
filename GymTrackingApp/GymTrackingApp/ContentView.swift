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
    static var userId: Int = 0
    
    var title : some View {
        Text("Your Gym Tracker")
            .bold()
            .padding(50)
    }
    
    var usernameField : some View {
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
    }
    
    var passwordField : some View {
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
    }
    
    var loginButton : some View {
        Button {
            
        } label: {
            Text("Log In")
                .font(.title)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        } // end button
    }
    
    var createAccountButton : some View {
        NavigationLink {
            CreateAccountPage()
        } label: {
            Text("Create Account")
                .font(.caption)
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 1)
                )
        }
    }
    
    
    var guestLogin : some View {
        NavigationLink {
            MainPage()
        } label: {
            Text("GUEST LOGIN")
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                title
                Spacer()
                
                VStack {
                    usernameField
                    passwordField
                }
                .padding([.leading, .trailing], 20)
                
                HStack {
                    createAccountButton
                    loginButton
                }
                .padding(20)
                
                guestLogin
                Spacer()
            } // end main Vstack
        } // end navStack
    } // end body
} // end contentview

#Preview {
    ContentView()
}
