//
//  PartenaireViewModel.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 13/05/2024.
//

import Foundation

enum PartenaireState {
    case notAvailable
    case loading
    case success(data: Codable)
    case error(error: Error)
}

@MainActor
class PartenaireViewModel: ObservableObject {
    @Published var state: PartenaireState = .notAvailable
    private let service: PartenaireService
    
    init(service: PartenaireService) {
        self.service = service
    }
    
    func fetchAllPartenaires() async {
        state = .loading
        do {
            let parts = try await service.getAllPartenaires()
            state = .success(data: Dictionary(grouping: parts, by: { $0.type.name }))
        } catch {
            state = .error(error: error)
            print("\(error) in fetch all actualities")
        }
    }
}
