//
//  A524View.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI

struct A524View: View {
    @State private var specificitesExpand = false
    @State private var alertExplain = false
    
    var body: some View {
        VStack(alignment: .center) {
            CarMapView()
            
            ScrollView {
                DisclosureGroup(
                    isExpanded: $specificitesExpand,
                    content: {
                        VStack(spacing: 20) {
                            SpecificiteView(spec: "Puissance", value: "Plus de 950 ch")
                            SpecificiteView(spec: "Vitesse maximale", value: "355 km/h")
                            SpecificiteView(spec: "Limite de régime", value: "15 000 tr/min")
                            SpecificiteView(spec: "Poids", value: "796 kg") 
                                                // (avec conducteur, caméras et ballast)
                            SpecificiteView(spec: "Longueur totale", value: "5620 mm")
                            SpecificiteView(spec: "Limite de débit de carburant", value: "100 kg/h")
                        }
                        .padding(.horizontal, 15)
                    },
                    label: {
                        Text("SPÉCIFICITÉS TECHNIQUES")
                            .semibold(size: 24)
                            .padding(5)
                    }
                )
            }
            .alert(isPresented: $alertExplain) {
                Alert(
                    title: Text("A524"),
                    message: Text("L’A524 propose un concept inédit, créé pour les deux prochaines saisons, et marqué par des solutions innovantes issues des enseignements de ses prédécesseuses. Cette approche audacieuse permettra à l’équipe de mettre en œuvre un développement plus important ces deux futures années avant la révolution du règlement technique qui s'ensuivra.\n\nL’A524 est conçue sur les deux sites de BWT Alpine F1 Team. Enstone est au cœur des opérations châssis de l’écurie sous la supervision de son directeur technique, Matt Harman. De l’autre côté de la Manche, Viry-Châtillon est la base dédiée à la conception et au développement du groupe propulseur de BWT Alpine F1 Team, sous la houlette de son directeur technique, Éric Meignan.")
                )
            }
        }
        .task {
            alertExplain.toggle()
        }
    }
}

private struct SpecificiteView: View {
    @State var spec: String
    @State var value: String
    
    var body: some View {
        HStack {
            Text(spec)
                .regular(size: 16)
            Spacer(minLength: 25)
            Text(value.uppercased())
                .semibold(size: 20)
        }
    }
}

#Preview {
    A524View()
}
