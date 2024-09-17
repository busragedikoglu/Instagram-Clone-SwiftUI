//
//  HomeView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 17.09.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var authService = AuthService()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            authService.signOut()
            dismiss()
        }, label: {
            Text("Sign Out")
        })
        .navigationBarBackButtonHidden(true)
    }
}
