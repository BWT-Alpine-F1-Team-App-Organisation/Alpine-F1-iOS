//
//  ListTeamSNView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 16/05/2024.
//

import SwiftUI

struct ListTeamSNView: View {
    @StateObject var snViewModel = SocialNetworkViewModel(service: SocialNetworkService())
    @Binding var load: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            switch snViewModel.state {
                case .success(let data):
                    if let allSnTeam = data as? [SocialNetwork] {
                        ForEach(allSnTeam, id: \.self._id) { sn in
                            Button {
                                UIApplication.shared.open(sn.url)
                            } label: {
                                Image(sn.unit.name)
                            }
                        }
                    }
                default:
                    Text("")
            }
        }
        .frame(width: 200)
        .padding(10)
        .background(.gray.opacity(0.3))
        .cornerRadius(20)
        .shadow(radius: 10)
        .task {
            if !load {
                await snViewModel.fetchTeamSocialNetworks()
                load.toggle()
            }
        }
    }
}

#Preview {
    ListTeamSNView(load: .constant(false))
}
