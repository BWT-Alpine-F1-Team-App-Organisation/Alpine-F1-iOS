//
//  SliderSignView.swift
//  BWT Alpine F1® Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import SwiftUI

struct SliderSignView: View {
    @State private var isShowingSignIn = true
    @Binding var isShowingMenu: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                if isShowingSignIn {
                    SignInView(isShowingSignIn: $isShowingSignIn, isShowingMenu: $isShowingMenu)
                        .transition(.move(edge: .trailing))
                } else {
                    SignUpView(isShowingSignIn: $isShowingSignIn, isShowingMenu: $isShowingMenu)
                        .transition(.move(edge: .trailing))
                }
            }
            .navigationBarTitle(isShowingSignIn ? "Sign in" : "Sign up", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button {
                        isShowingMenu = false
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.accentColor)
                    }
            )
        }
    }
}

#Preview {
    SliderSignView(isShowingMenu: .constant(true))
}
