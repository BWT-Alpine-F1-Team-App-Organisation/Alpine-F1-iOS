//
//  SignInButtons.swift
//  BWT Alpine F1® Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import SwiftUI

struct SignInButtons: View {
    @EnvironmentObject var authVM: AuthViewModel
    @Binding var isShowingMenu: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(TypeConnexion.allCases, id: \.self) { rs in
                if rs != .email {
                    Button {
                        Task {
                            await authVM.signWith(rs: rs)
                            isShowingMenu = !authVM.isLogged()
                        }
                    } label: {
                        if rs == .apple {
                            Image(systemName: "applelogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.primary)
                                .frame(height: 25)
                        } else {
                            Image("\(rs.rawValue.lowercased())-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.primary)
                                .frame(height: 25)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SignInButtons(isShowingMenu: .constant(true))
}
