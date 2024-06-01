//
//  SignInView.swift
//  BWT Alpine F1® Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var username = ""
    @State private var passwd = ""
    @Binding var isShowingSignIn: Bool
    @Binding var isShowingMenu: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Image("team-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding(.bottom, 15)
                
                VStack(spacing: 5) {
                    TextField("email/name", text: $username)
                        .padding(10)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(10)
                    
                    SecureField("password", text: $passwd)
                        .padding(10)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button {
                    Task.init {
                        await authVM.signInEmail(email: username, password: passwd)
                        if authVM.isLogged() { isShowingMenu = false }
                    }
                } label: {
                    Text("Se connecter")
                        .padding()
                        .background(Color.accentColor)
                        .semibold(size: 20)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                HStack {
                    Text("Se connecter avec : ")
                    SignInButtons(isShowingMenu: $isShowingMenu)
                }
                .padding()
                
                Button {
                    withAnimation {
                        isShowingSignIn.toggle()
                    }
                } label: {
                    Text("Je n'ai pas de compte")
                        .underline()
                }
            }
            .regular(size: 20)
        }
    }
}

#Preview {
    SignInView(isShowingSignIn: .constant(true), isShowingMenu: .constant(false))
}
