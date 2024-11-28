//
//  ContentView.swift
//  GymTrackingApp
//
//  Created by Aarav on 11/28/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your Gym Tracker")
                .bold()
                .padding(50)
            
            HStack {
                Text("Username")
                
            }
            
            HStack {
                Text("Password")
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
