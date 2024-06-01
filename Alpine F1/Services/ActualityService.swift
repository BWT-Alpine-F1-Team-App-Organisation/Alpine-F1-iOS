//
//  ActualityService.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import Foundation

struct DataWebpage: Codable {
    let bold: String
    let regular: [String]
    let citations: [Citation]
    
    struct Citation: Codable {
        let person: String
        let citation: String
    }
}

struct ActualityService {
    func getAllActualities() async throws -> [Actuality] {
        return try await APIData.decodeAPIInfo(route: "actus", to: [Actuality].self)
    }
    
    func getDataFromUrl(url: String) async throws -> DataWebpage {
        return try await APIData.decodeAPIInfo(route: "actus/fromUrl?url=\(url)", to: DataWebpage.self)
    }
}
