//
//  AuthViewModel.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import Foundation
import Firebase
import GoogleSignIn

enum StateAuth {
    case notAvailable
    case loading
    case success(data: Codable? = nil)
    case failed(error: Error)
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var currentUser: UserApp? = nil
    @Published var state: StateAuth = .notAvailable
    private let service: AuthService
    
    init() {
        service = AuthService()
        currentUser = getCurrentUser()
    }
    
    func isLogged() -> Bool {
        return self.currentUser != nil
    }
    
    private func getCurrentUser() -> UserApp? {
        if let storedData = UserDefaults.standard.data(forKey: "currentUser"),
           let decodedPerson = try? JSONDecoder().decode(UserApp.self, from: storedData) {
            return decodedPerson
        }
        return nil
    }
    
    private func setCurrentUser(user: UserApp?) {
        if let encodedData = try? JSONEncoder().encode(user) {
            DispatchQueue.main.async {
                UserDefaults.standard.set(encodedData, forKey: "currentUser")
            }
            self.currentUser = user
        }
    }
    
    func signInEmail(email: String, password: String) async {
        do {
            let userReturn = try await service.signInWithEmail(email: email, password: password)
            self.setCurrentUser(user: UserApp(from: userReturn, connexion: .email))
            state = .success()
        } catch {
            state = .failed(error: error)
            print(error.localizedDescription)
        }
    }
    
    func signUpEmail(username: String, email: String, password: String) async {
        do {
            let userReturn = try await service.signUpWithEmail(username: username, email: email, password: password)
            self.setCurrentUser(user: UserApp(from: userReturn, connexion: .email))
            state = .success()
        } catch {
            state = .failed(error: error)
            print(error.localizedDescription)
        }
    }
    
    /**
     * Connection with a certain social network (Apple, Google or Github)
     * @param rs the social network
     */
    func signWith(rs: TypeConnexion) async {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        self.state = .loading
        do {
            let user = try await GIDSignIn.sharedInstance.signIn(withPresenting: AppUtility.rootViewController)
            switch(rs) {
                //case "Apple": self.authApple()
                case .google: await self.authGoogle(user: user)
                //case "GitHub": self.authGithub()
                default: return
            }
        } catch {
            self.state = .failed(error: error)
            print(error.localizedDescription)
        }
    }
    
    private func authGoogle(user: GIDSignInResult?) async {
        do {
            let userReturn = try await service.signGoogle(user: user)
            self.setCurrentUser(user: UserApp(from: userReturn, connexion: .google))
            state = .success()
        } catch {
            state = .failed(error: error)
            print(error.localizedDescription)
        }
    }
    
    func disconnect() {
        if self.currentUser != nil {
            self.state = .loading
            do {
                try service.signOut()
                self.setCurrentUser(user: nil)
                self.state = .success()
            } catch let signOutError as NSError {
                self.state = .failed(error: signOutError)
                print("Erreur de déconnexion : \(signOutError)")
            }
        }
    }
}
