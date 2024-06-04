//
//  IntroView.swift
//  BWT Alpine F1® Team
//
//  Created by Florian DAVID on 04/06/2024.
//

import SwiftUI

struct IntroView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.0, green: 0.0, blue: 0.0),
                    Color(red: 0.0, green: 0.0, blue: 0.0),
                    Color(red: 0.06, green: 0.12, blue: 0.20),
                    Color(red: 0.12, green: 0.23, blue: 0.39),
                    Color(red: 0.24, green: 0.47, blue: 0.61),
                    Color(red: 0.36, green: 0.71, blue: 0.82),
                    Color(red: 0.48, green: 0.94, blue: 1.0),
                    Color(red: 0.70, green: 0.97, blue: 1.0),
                    Color(red: 1.0, green: 1.0, blue: 1.0),
                    Color(red: 1.0, green: 1.0, blue: 1.0),
                    Color(red: 1.0, green: 0.6, blue: 0.8),
                    Color(red: 1.0, green: 0.4, blue: 0.7),
                    Color(red: 1.0, green: 0.2, blue: 0.6),
                    Color(red: 0.9, green: 0.1, blue: 0.5),
                    Color(red: 0.7, green: 0.2, blue: 0.4),
                    Color(red: 0.4, green: 0.1, blue: 0.3),
                    Color(red: 0.0, green: 0.0, blue: 0.0),
                    Color(red: 0.0, green: 0.0, blue: 0.0),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Image("team-logo-intro")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isActive = true
                }
            }
        }
        .opacity(isActive ? 0 : 1)
    }
}

#Preview {
    IntroView()
}
