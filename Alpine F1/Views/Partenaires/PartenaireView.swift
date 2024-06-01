//
//  PartenaireView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 13/05/2024.
//

import SwiftUI

struct PartenaireView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var partenaire: Partenaire
    
    var body: some View {
        VStack(spacing: 15) {
            let imageURL = colorScheme == .dark ? partenaire.image_white : partenaire.image_black
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }
            
            HStack {
                ForEach(partenaire.socialNetworks, id: \.self._id) { sn in
                    Image(sn.unit.name)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            UIApplication.shared.open(sn.url)
                        }
                }
            }
            
            ScrollView {
                Text(partenaire.description)
                    .regular(size: 16)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal)
        .navigationBarTitle(partenaire.name, displayMode: .inline)
        .navigationBarItems(
            trailing:
                Group {
                    if let site = partenaire.site {
                        Button {
                            UIApplication.shared.open(site)
                        } label: {
                            Image(systemName: "globe")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
        )
    }
}

#Preview {
    PartenaireView(partenaire: Partenaire())
}
