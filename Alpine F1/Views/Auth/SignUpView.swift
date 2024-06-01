//
//  SignUpView.swift
//  BWT Alpine F1® Team
//
//  Created by Florian DAVID on 21/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @Binding var isShowingSignIn: Bool
    @Binding var isShowingMenu: Bool
    @State private var alertInput = false
    
    @State private var username = ""
    @State private var email = ""
    @State private var passwd = ""
    @State private var passwdConfirm = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Image("team-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding(.bottom, 15)
                
                VStack(spacing: 5) {
                    TextField("Username", text: $username)
                        .padding(10)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(10)
                    
                    TextField("Email", text: $email)
                        .padding(10)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(10)
                    
                    HStack(spacing: 5) {
                        SecureField("password", text: $passwd)
                            .padding(10)
                            .background(.gray.opacity(0.3))
                            .cornerRadius(10)
                            .disableAutocorrection(true)
                        
                        SecureField("Confirm password", text: $passwdConfirm)
                            .padding(10)
                            .background(.gray.opacity(0.3))
                            .cornerRadius(10)
                            .disableAutocorrection(true)
                    }
                }
                .padding(.horizontal)
                
                let params = [username, email, passwd, passwdConfirm]
                if !params.allSatisfy({ $0 == "" }) {
                    checkInputErrors(params)
                }
                
                Button {
                    Task.init {
                        if getWarning(params).isEmpty {
                            await authVM.signUpEmail(username: username, email: email, password: passwd)
                            isShowingMenu = authVM.currentUser != nil
                        }
                    }
                } label: {
                    Text("Créer un compte")
                        .padding()
                        .background(Color.accentColor)
                        .semibold(size: 20)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Button {
                    withAnimation {
                        isShowingSignIn.toggle()
                    }
                } label: {
                    Text("J'ai déjà un compte")
                        .underline()
                }
            }
            .regular(size: 20)
        }
    }
    
    // Returns a View
    @ViewBuilder
    func checkInputErrors(_ params: [String]) -> some View {
        let warning = getWarning(params)
        if !warning.isEmpty {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                Text(warning)
            }
            .font(.system(size: 16))
            .foregroundColor(.red)
        }
    }
    
    func getWarning(_ params: [String]) -> String {
        if params[0].isEmpty || params[1].isEmpty || params[2].isEmpty || params[3].isEmpty {
            return NSLocalizedString("allFilled", comment: "")
        } else if !params[1].isEmail() {
            return NSLocalizedString("emailNotValid", comment: "")
        } else if params[2].count < 8 {
            return NSLocalizedString("passwdLen8", comment: "")
        } else if params[2] != params[3] {
            return NSLocalizedString("notSamePasswd", comment: "")
        }
        return ""
    }
}

#Preview {
    SignUpView(isShowingSignIn: .constant(true), isShowingMenu: .constant(true))
        .environmentObject(AuthViewModel())
}
