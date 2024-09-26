//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import SwiftUI

struct ProfileView: View {
    let user: UserModel

    var posts: [PostModel] {
        return PostModel.MOCK_POST.filter({ $0.user?.username == user.username })
    }

    var body: some View {
        ScrollView {
            VStack {
               ProfileHeaderView(user: user)
                PostGridView(posts: posts)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: UserModel.MOCK_USER[0])
}
