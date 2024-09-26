//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: UserModel
    var posts: [PostModel] {
        return PostModel.MOCK_POST.filter({ $0.user?.username == user.username })
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                ProfileHeaderView(user: user)
//                    PostGridView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color("buttonTextColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: UserModel.MOCK_USER[0])
}
