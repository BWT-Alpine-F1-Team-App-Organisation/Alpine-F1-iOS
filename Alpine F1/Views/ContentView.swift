//
//  ContentView.swift
//  Alpine F1
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var titleTab = "Accueil"
    @State private var showMenu = false
    @State private var profileOrSignIn = false
    
    var body: some View {
        NavigationView {
            TabView(selection: $titleTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Accueil")
                    }
                    .tag("Accueil")
                
                TeamView()
                    .tabItem {
                        Image("alpine-a-icon-mini")
                        Text("Équipe F1®")
                    }
                    .tag("Équipe F1®")
                
                A524View()
                    .tabItem {
                        Image("A524-mini")
                        Text("A524")
                    }
                    .tag("A524")
                
                ListActualitiesView()
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("Actualités F1®")
                    }
                    .tag("Actualités F1®")
            }
            .navigationBarTitle(titleTab, displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button {
                        withAnimation {
                            showMenu.toggle()
                        }
                    } label: {
                        Image(systemName: showMenu ? "chevron.left" : "line.horizontal.3")
                    }
                    .frame(width: 35)
                , trailing:
                    Button {
                        profileOrSignIn.toggle()
                    } label: {
                        if let user = authVM.currentUser {
                            AsyncImage(url: user.photoURL) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "person.crop.circle.badge.checkmark")
                                    .renderingMode(.original)
                            }
                        } else {
                            Image(systemName: "person.circle.fill")
                        }
                    }
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("alpine-logo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .overlay {
                if showMenu {
                    NavigationMenuView()
                }
            }
            .sheet(isPresented: $profileOrSignIn){
                if authVM.currentUser != nil {
                    ProfileView(isShowingMenu: $profileOrSignIn)
                } else {
                    SliderSignView(isShowingMenu: $profileOrSignIn)
                }
            }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
