//
//  MenuItemsView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 10/05/2024.
//

import SwiftUI

struct MenuItemsView: View {
    @State private var sheet = false
    
    var body: some View {
        VStack {
            List {
                Button {
                    sheet.toggle()
                } label: {
                    NavigationLink(destination: {}) {
                        Text("Partenaires")
                            .regular(size: 16)
                    }
                }
                NavigationLink(destination: SocialNetworksView()) {
                    Text("Réseaux sociaux")
                        .regular(size: 16)
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $sheet) {
                AllPartenairesView(sheet: $sheet)
            }
            
            Spacer()
            Image("team-logo")
                .resizable()
                .scaledToFit()
                .frame(height: 75)
        }
    }
}

#Preview {
    MenuItemsView()
}
