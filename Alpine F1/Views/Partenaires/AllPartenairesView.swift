//
//  AllPartenairesView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 13/05/2024.
//

import SwiftUI

struct AllPartenairesView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var partenVM = PartenaireViewModel(service: PartenaireService())
    @State private var selectedPartenaire: Partenaire?
    @Binding var sheet: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                switch partenVM.state {
                    case .loading:
                        ProgressView()
                    case .success(let data):
                        if let partenaires = data as? [String: [Partenaire]] {
                            VStack {
                                ScrollView {
                                    ListPartenairesView(partenaires: partenaires)
                                }
                            }
                        }
                    default: Text("")
                }
            }
            .navigationBarTitle("Partenaires", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button {
                        sheet = false
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.accentColor)
                    }
            )
            .onAppear(perform: {
                Task {
                    await partenVM.fetchAllPartenaires()
                }
            })
        }
    }
}

#Preview {
    AllPartenairesView(sheet: .constant(true))
        //.environmentObject(PartenaireViewModel(service: PartenaireService()))
}
