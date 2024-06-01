//
//  AuthService.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import Foundation
import Firebase
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

enum FirebaseAuthError: Error {
    case userNotFound
    case authentificationError(error: String)
    case emailNotSent
    case updateError(for: String)
}

struct AuthService {
    /**
     * Connexion with email
     * @param email: user email
     * @param password: user password
     */
    func signInWithEmail(email: String, password: String) async throws -> User {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
            
        do {
            let authResult = try await Auth.auth().signIn(with: credential)
            return authResult.user
        } catch {
            throw FirebaseAuthError.authentificationError(error: error.localizedDescription)
        }
    }
    
    /**
     * User account creation
     * @param email: user email
     * @param password: user password
     */
    func signUpWithEmail(username: String, email: String, password: String) async throws -> User  {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = authResult.user
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            try await changeRequest.commitChanges()
            return user
        } catch {
            throw FirebaseAuthError.authentificationError(error: error.localizedDescription)
        }
    }
    
    /**
     * Connexion with Apple
     */
    func signApple() {
        return
    }
    
    /**
     * Connection with Google
     * @param user: the user who wants to connect
     */
    func signGoogle(user: GIDSignInResult?) async throws -> User {
        do {
            guard
                let user = user?.user,
                let idToken = user.idToken
            else {
                throw FirebaseAuthError.userNotFound
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            let authResult = try await Auth.auth().signIn(with: credential)
            return authResult.user
        } catch {
            throw FirebaseAuthError.authentificationError(error: error.localizedDescription)
        }
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
        } catch {
            throw FirebaseAuthError.authentificationError(error: error.localizedDescription)
        }
    }
}
