//
//  Alpine_F1App.swift
//  Alpine F1
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Alpine_F1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        setFontsForBars()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
    
    /**
     * Set navigation bar (and their button) fonts for the application
     */
    func setFontsForBars() {
        let attributesBold: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Alpine New Alps Semibold", size: 18)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Alpine New Alps Regular", size: 14)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UINavigationBar.appearance().titleTextAttributes = attributesBold
    }
}
