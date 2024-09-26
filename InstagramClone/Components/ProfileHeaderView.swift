//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user:UserModel
    @State private var showEditProfile = false
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 10, title: "Posts")
                    UserStatView(value: 15, title: "Follower")
                    UserStatView(value: 20, title: "Following")
                }
            }.padding(.horizontal)
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Button {
                if user.isCurrentUser{
                    showEditProfile.toggle()
                }else{
                    print("Following")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white: Color(.blue))
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .foregroundStyle(Color("buttonTextColor"))
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(user.isCurrentUser ? .gray:.clear, lineWidth: 1))
            }

            Divider()
        }.fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: UserModel.MOCK_USER[0])
}
