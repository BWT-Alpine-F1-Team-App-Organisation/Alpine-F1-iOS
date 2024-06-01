//
//  ListPartenairesView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 15/05/2024.
//

import SwiftUI

struct ListPartenairesView: View {
    @State var partenaires: [String: [Partenaire]]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            let listKeys = Array(partenaires.keys).sorted { $0 > $1 }
            ForEach(listKeys, id: \.self) { p in
                let text = Text(p)
                            .semibold(size: 14)
                            .foregroundColor(.accentColor)
                Section(header: text) {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach(partenaires[p]!, id: \.self._id) { part in
                            AsyncImage(url: part.image_black) { image in
                                NavigationLink(destination: PartenaireView(partenaire: part)) {
                                    image
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 80)
                                        .foregroundColor(.primary)
                                }
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 80)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ListPartenairesView(partenaires: [:])
}
