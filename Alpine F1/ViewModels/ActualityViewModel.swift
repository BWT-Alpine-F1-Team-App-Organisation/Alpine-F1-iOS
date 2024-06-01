//
//  ActualityViewModel.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import Foundation

enum ActualityState {
    case notAvailable
    case loading
    case success(data: Codable)
    case error(error: Error)
}

@MainActor
class ActualityViewModel: ObservableObject {
    @Published var state: ActualityState = .notAvailable
    private let service: ActualityService
    
    init(service: ActualityService) {
        self.service = service
    }
    
    func fetchAllActus() async {
        state = .loading
        do {
            let actus = try await service.getAllActualities()
            state = .success(data: actus)
        } catch {
            state = .error(error: error)
            print("\(error) in fetch all actualities")
        }
    }
    
    func fetchActualityURL(url: String) async {
        state = .loading
        do {
            let dataActu = try await service.getDataFromUrl(url: url)
            state = .success(data: dataActu)
        } catch {
            state = .error(error: error)
            print("\(error) in fetch actuality by url")
        }
    }
}
