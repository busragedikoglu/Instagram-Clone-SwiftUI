//
//  LoginView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 17.09.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var showHomeView: Bool = false
    @State private var showSignUpView: Bool = false


    @ObservedObject private var authService = AuthService()

    var body: some View {
        NavigationStack {
            Image("Instagram")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 100)
            VStack {
                inputField(textName: "Email", imageName: "mail", isSecureField: false, text: $viewModel.email)
                inputField(textName: "Password", imageName: "lock", isSecureField: true, text: $viewModel.password)
                forgetPasswordButton
                signUpButton
                signInButton
            }
            .padding()
            .onAppear {
            }
            .navigationDestination(isPresented: $showHomeView) {
//                MainTabView(user: user )
            }
            .navigationDestination(isPresented: $showSignUpView) {
                RegisterView()
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
            Task { try await viewModel.signIn() }
        }) {
            Text("Sign In")
                .font(.footnote)
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

    private var forgetPasswordButton: some View {
        Button(action: {
            print("Forget Password")
        }) {
            Text("Forget Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.trailing, 24)
        }
    }

    private var signUpButton: some View {
        Button(action: {
            showSignUpView = true
        }) {
            Text("Don't have an account?")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 70)
    }
}
