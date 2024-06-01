//
//  Extensions.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 01/06/2024.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: self)
    }
}
