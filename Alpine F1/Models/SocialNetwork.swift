//
//  SocialNetwork.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 13/05/2024.
//

import Foundation

struct SocialNetwork: Codable {
    let _id: String
    let accountName: String
    let unit: TypeSocialNetwork
    let url: URL
}

struct TypeSocialNetwork: Codable {
    let _id: String
    let name: String
}
