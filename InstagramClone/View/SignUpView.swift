//
//  SignUpView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 17.09.2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showHomeView: Bool = false
    @State private var showSignInView: Bool = false
    @ObservedObject private var authService = AuthService()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Create Account")
                    .font(.title)
                    .padding(.bottom, 80)
                inputField(textName: "Name", imageName: "person", isSecureField: false, text: $name)
                inputField(textName: "Email", imageName: "mail", isSecureField: false, text: $email)
                inputField(textName: "Password", imageName: "lock", isSecureField: true, text: $password)
                signUpButton
            }
            .padding()
            .navigationDestination(isPresented: $showHomeView) {
                HomeView()
            }
            .navigationDestination(isPresented: $showSignInView) {
                SignInView()
            }
        }
        .accentColor(.black)
    }

    private func inputField(textName: String, imageName: String, isSecureField: Bool, text: Binding<String>) -> some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.black)
                .padding(.leading, 8)
            if isSecureField == true {
                SecureField(textName, text: text)
                    .padding(14)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
            } else {
                TextField(textName, text: text)
                    .padding(14)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 2)
        }
        .padding()
    }

    private var signUpButton: some View {
        Button(action: {
            authService.signUpClicked(email: email, password: password) { success in
                if success {
                    showHomeView = true
                }
            }

        }) {
            Text("Register")
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
        }
        .padding()
    }
}
