//
//  HomeView.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to Plasma!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("You are logged in. 🎉")
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
