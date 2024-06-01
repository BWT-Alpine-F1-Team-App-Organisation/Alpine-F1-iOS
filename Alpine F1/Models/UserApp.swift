//
//  UserApp.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

/**
 * Class based on the FIRUser structure
 * Purpose : to facilitate its encoding so that it can be stored in UserDefaults
 */
struct UserApp: Codable {
    var id: String
    var name: String
    var email: String
    var phoneNumber: String
    var photoURL: URL?
    var isAnonymous: Bool
    var isEmailVerified: Bool
    var connexion: TypeConnexion       // The connexion method (Email, Apple, Google or GitHub)
    
    init(from user: User, connexion: TypeConnexion) {
        self.id = user.uid
        self.name = user.displayName ?? "User"
        self.email = user.email ?? ""
        self.phoneNumber = user.phoneNumber ?? "No"
        self.photoURL = user.photoURL
        self.isAnonymous = user.isAnonymous
        self.isEmailVerified = user.isEmailVerified
        self.connexion = connexion
    }
}

enum TypeConnexion: String, Codable, CaseIterable {
    case email = "Email"
    case google = "Google"
    case apple = "Apple"
    case github = "GitHub"
}
