//
//  LoginView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 17.09.2024.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showHomeView: Bool = false
    @State private var showSignUpView: Bool = false

    @ObservedObject private var authService = AuthService()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Instagram Clone")
                    .font(.title)
                    .padding(.bottom, 100)
                inputField(textName: "Email", imageName: "mail", isSecureField: false, text: $email)
                inputField(textName: "Password", imageName: "lock", isSecureField: true, text: $password)
                signUpButton
                signInButton
            }
            .padding()
            .onAppear {
                authService.checkUserSession()
                if authService.isCurrentUser {
                    showHomeView = true
                }
            }
            .navigationDestination(isPresented: $showHomeView) {
                HomeView()
            }
            .navigationDestination(isPresented: $showSignUpView) {
                SignUpView()
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

    private var signInButton: some View {
        Button(action: {
            authService.signInClicked(email: email, password: password) { uid in
                if let uid = uid {
                    showHomeView = true
                } else {
                    print("Login Failed")
                }
            }

        }) {
            Text("Sign In")
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

    private var signUpButton: some View {
        Button(action: {
            showSignUpView = true
        }) {
            Text("Don't have an account?")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 50)
    }
}
