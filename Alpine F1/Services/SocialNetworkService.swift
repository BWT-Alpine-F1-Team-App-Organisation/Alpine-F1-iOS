//
//  SocialNetworkService.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 16/05/2024.
//

import Foundation

struct SocialNetworkService {
    func getAllPostsByTeam() async throws -> [PostSN] {
        return try await APIData.decodeAPIInfo(route: "socialNetworks/posts-team", to: [PostSN].self)
    }
    
    func getTeamSocialNetworks() async throws -> [SocialNetwork] {
        return try await APIData.decodeAPIInfo(route: "socialNetworks?name=alpinef1team", to: [SocialNetwork].self)
    }
}
