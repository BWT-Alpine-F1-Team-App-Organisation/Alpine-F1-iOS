//
//  HomeView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 15) {
            Image("alpine-pilots")
                .resizable()
                .scaledToFit()
            
            Text("Faites de 2024 votre saison !".uppercased())
                .semibold(size: 28)
            
            Text("Chaque saison est un nouveau défi ! Nous sommes en recherche continue de coéquipiers talentueux et passionnés qui partagent nos valeurs :  l’excellence - l’engagement et le sens du détail. En rejoignant Alpine F1, venez prendre part à l’aventure internationale d’Alpine et soyez prêt à atteindre de nouveaux sommets dès 2024 !")
                .regular(size: 20)
                .padding(.horizontal)
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    HomeView()
}
