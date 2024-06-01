//
//  SocialNetworksView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 16/05/2024.
//

import SwiftUI

struct SocialNetworksView: View {
    @StateObject var snViewModel = SocialNetworkViewModel(service: SocialNetworkService())
    @State private var load = false
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                Text("Suivez-nous sur les réseaux sociaux :")
                    .semibold(size: 20)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                
                ListTeamSNView(load: $load)
            }

            ScrollView {
                switch snViewModel.state {
                    case .success(let data):
                        if let posts = data as? [PostSN] {
                            PostsSNView(posts: posts)
                        }
                    case .error(let error):
                        Text(error.localizedDescription)
                    default:
                        Text("")
                }
            }
        }
        .onChange(of: load, perform: { _ in
            Task {
                await snViewModel.fetchAllTeamPosts()
            }
        })
        .navigationBarTitle("Réseaux sociaux", displayMode: .inline)
    }
}

#Preview {
    SocialNetworksView()
}
