//
//  NavigationMenuView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 15/05/2024.
//

import SwiftUI

struct NavigationMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                let color: Color = colorScheme == .dark ? .black : .white
                color.opacity(0.75).ignoresSafeArea()
                HStack {
                    ZStack {
                        color.ignoresSafeArea()
                        MenuItemsView()
                    }
                    .frame(width: UIScreen.main.bounds.width * (2/3))
                    
                    Spacer()
                        .frame(width: geometry.safeAreaInsets.bottom)
                }
                .zIndex(1)
            }
        }
    }
}

#Preview {
    NavigationMenuView()
}
