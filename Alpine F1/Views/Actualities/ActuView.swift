//
//  ActuView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI

struct ActuView: View {
    @StateObject var actuVM = ActualityViewModel(service: ActualityService())
    @State var actuality: Actuality
    
    var body: some View {
        ScrollView {
            Text(actuality.title)
                .semibold(size: 20)
            
            Text(actuality.date)
                .regular(size: 16)
                .padding(5)
            
            AsyncImage(url: actuality.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            
            switch actuVM.state {
                case .loading:
                    ProgressView()
                case .success(let data):
                    if let dataActu = data as? DataWebpage {
                        VStack(spacing: 10) {
                            Text(dataActu.bold)
                                .semibold(size: 14)
                            
                            ForEach(dataActu.regular, id: \.self) { textReg in
                                Text(textReg)
                                    .regular(size: 14)
                            }
                            
                            ForEach(dataActu.citations, id: \.self.person) { citation in
                                VStack {
                                    Text("\(citation.person) :").semibold(size: 14)
                                    Text("«\(citation.citation)»").regular(size: 14)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                default:
                    Text("No information about this actuality")
                        .padding()
                }
            
            
        }
        .multilineTextAlignment(.center)
        .task {
            if let url = actuality.link {
                await actuVM.fetchActualityURL(url: url.absoluteString)
            }
        }
    }
}

#Preview {
    ActuView(actuality: Actuality(title: "BWT ALPINE F1 TEAM SUR DE BONNES BASES AVEC SES DEUX VOITURES DANS LE MATCH POUR LES POINTS AVANT LE GRAND PRIX DE SINGAPOUR", link: URL(string: "https://www.alpinecars.fr/formule-1/actualites-f1/qualifications-singapore-gp-2023.html"), image: URL(string: "https://cdn.group.renault.com/alp/master/alpine-new-cars/editorial/racing-f1/2023/alpine-editorial-racing-276.jpg"), date: "16/09/2023"))
}
