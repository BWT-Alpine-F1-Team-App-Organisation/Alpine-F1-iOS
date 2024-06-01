//
//  CarMapView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI

private struct ButtonCircleElement: View {
    @State private var alertElement = false
    @State var title: String
    @State var content: String
    
    var body: some View {
        Button {
            alertElement.toggle()
        } label: {
            ZStack {
                Circle()
                    .frame(height: 15)
            }
            .foregroundColor(.green)
        }
        .alert(title, isPresented: $alertElement) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(content)
        }
    }
}

struct CarMapView: View {
    var body: some View {
        ZStack {
            Image("A524-model")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
            
            ButtonCircleElement(title: "Suspensions", content: "Triangles supérieurs et inférieurs en fibre de carbone. Les Moyeux en aluminium sont complétés par des jantes BBS standard en magnésium usiné et des enjoliveurs de roue standard FiA.")
                .offset(x: -85, y: 30)
            
            ButtonCircleElement(title: "Système de freinage", content: "Disques et plaquettes en carbone. Étriers et maîtres-cylindres Brembo S.p.A. avec système de freinage par câble entièrement intégré.")
                .offset(x: -20, y: 25)
            
            ButtonCircleElement(title: "Châssis", content: "Monocoque composite moulée en fibre de carbone et aluminium en nid d’abeilles, produite par Alpine F1® Team et conçue pour une résistance maximale et un poids minimal. Intègre le groupe propulseur Renault E-Tech 2023 comme élément autoporté.")
                .offset(x: 30, y: 35)
            
            ButtonCircleElement(title: "Transmission & Hydraulique", content: "Boîte de vitesses semi-automatique à huit vitesses + marche arrière. Système “Quickshift” pour maximiser le temps de passage des rapports avec un différentiel à commande hydraulique. Alimentation hydraulique pour le pilotage du groupe moteur, de la direction assistée, du DRS et de l'embrayage.")
                .offset(x: 100, y: 0)
        }
    }
}

#Preview {
    CarMapView()
}
