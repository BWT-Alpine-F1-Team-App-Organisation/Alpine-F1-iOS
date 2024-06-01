//
//  APIData.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import Foundation

enum APIError: Error {
    case invalidStatusCode
}

struct APIData {
    /**
     * Retourne l'URL principal de l'API (stockée dans une variable d'environnement nommée URL_API)
     */
    private static func getApiURL() -> String {
        guard let url = ProcessInfo.processInfo.environment["URL_API"] else {
            return ""
        }
        return url
    }
    
    /**
     * Récupère les informations par rapport à une URL (utilisé seulement pour des requêtes GET avec paramètres ou des queries)
     * @route : la route de l'API Node.js correspondante
     * @to : le type de l'objet à récupérer
     * @return: l'objet décodé
     */
    static func decodeAPIInfo<T: Decodable>(route: String, to: T.Type) async throws -> T {
        let url = URL(string: "\(APIData.getApiURL())/\(route)")!
        let (data, resp) = try await URLSession.shared.data(from: url)
        
        guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidStatusCode
        }
        
        let decodingData = try JSONDecoder().decode(T.self, from: data)
        return decodingData
    }
}
