//
//  AppUtility.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import SwiftUI
import UIKit

final class AppUtility {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
