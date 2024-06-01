//
//  ProfileView.swift
//  BWT Alpine F1® Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @Binding var isShowingMenu: Bool
    @State private var alertDisconnect = false
    
    var body: some View {
        NavigationView {
            if let user = authVM.currentUser {
                VStack {
                    AsyncImage(url: user.photoURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(height: 200)
                            .padding()
                        
                    } placeholder: {
                        Image(systemName: "person.crop.circle.badge.checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
                    }
                    
                    Text(user.name)
                        .semibold(size: 26)
                    
                    Text(user.email)
                    Text(user.phoneNumber)
                    
                    HStack(spacing: 5) {
                        if user.connexion == .apple {
                            Image(systemName: "applelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                        } else {
                            Image("\(user.connexion.rawValue.lowercased())-logo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                        }
                        Text("Connecté via \(user.connexion.rawValue)")
                    }
                    
                    Spacer()
                    
                    Button {
                        alertDisconnect.toggle()
                    } label: {
                        Text("Se déconnecter")
                            .padding()
                            .background(Color.accentColor)
                            .semibold(size: 20)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .alert(isPresented: $alertDisconnect) {
                        Alert(
                            title: Text("Déconnexion"),
                            message: Text("Voulez-vous vraiment vous déconnecter ?"),
                            primaryButton: .cancel(),
                            secondaryButton: .destructive(Text("Oui")) {
                                authVM.disconnect()
                                isShowingMenu = authVM.currentUser != nil
                            }
                        )
                    }
                }
                .regular(size: 20)
                .navigationBarTitle(user.name, displayMode: .inline)
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
}

#Preview {
    ProfileView(isShowingMenu: .constant(true))
        .environmentObject(AuthViewModel())
}
