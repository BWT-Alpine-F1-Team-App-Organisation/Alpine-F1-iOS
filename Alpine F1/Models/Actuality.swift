//
//  Actuality.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import Foundation

struct Actuality: Codable, Hashable {
    let title: String
    let link: URL?
    let image: URL?
    let date: String
}
