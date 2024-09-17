//
//  LoginView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 17.09.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            Text("Instagram Clone")
                .font(.title)
                .padding(.bottom, 100)
            textFields(textName: "Email", imageName: "mail", secureField: false, text: $email)
            textFields(textName: "Password", imageName: "lock", secureField: true, text: $password)
            signInButton
        }
    }

    private func textFields(textName: String, imageName: String, secureField: Bool, text: Binding<String>) -> some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.black)
                .padding(.leading, 8)
            if secureField == true {
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
            if email.isEmpty || password.isEmpty {
                alertMessage = "Email and Password cannot be empty."
                isShowAlert = true
            } else {
                alertMessage = "Authentication failed. Please check your credentials."
                isShowAlert = true
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
}

#Preview {
    LoginView()
}
