//
//  FontsApp.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 17/05/2024.
//

import SwiftUI

extension View {
    func semibold(size: Int) -> some View {
        return self.font(.custom("Alpine New Alps Semibold", size: CGFloat(size)))
    }
    
    func regular(size: Int) -> some View {
        return self.font(.custom("Alpine New Alps Regular", size: CGFloat(size)))
    }
    
    func light(size: Int) -> some View {
        return self.font(.custom("Alpine New Alps Light", size: CGFloat(size)))
    }
}
