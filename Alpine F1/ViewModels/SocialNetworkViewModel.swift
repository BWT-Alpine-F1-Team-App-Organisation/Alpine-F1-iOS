//
//  SocialNetworkViewModel.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 31/05/2024.
//

import Foundation

enum SocialNetworkState {
    case notAvailable
    case loading
    case success(data: Codable? = nil)
    case error(error: Error)
}

@MainActor
class SocialNetworkViewModel: ObservableObject {
    @Published var state: SocialNetworkState = .notAvailable
    private let service: SocialNetworkService
    
    init(service: SocialNetworkService) {
        self.service = service
    }
    
    func fetchTeamSocialNetworks() async {
        state = .loading
        do {
            let sns = try await service.getTeamSocialNetworks()
            state = .success(data: sns)
        } catch {
            state = .error(error: error)
            print("\(error) in fetch all social networks")
        }
    }
    
    func fetchAllTeamPosts() async {
        state = .loading
        do {
            let sns = try await service.getAllPostsByTeam()
            state = .success(data: sns)
        } catch {
            state = .error(error: error)
            print("\(error) in fetch all team posts")
        }
    }
}
