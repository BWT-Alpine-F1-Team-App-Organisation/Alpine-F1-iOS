//
//  PartenaireService.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 13/05/2024.
//

import Foundation

struct PartenaireService {
    func getAllPartenaires() async throws -> [Partenaire] {
        return try await APIData.decodeAPIInfo(route: "partenaires", to: [Partenaire].self)
    }
}
