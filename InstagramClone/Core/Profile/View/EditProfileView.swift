//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 21.09.2024.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dissmis
    @StateObject var viewModel: EditProfileViewModel

    init(user: UserModel) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dissmis()
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button("Done") {
                        Task{try await  viewModel.updateUserData()}
                    }.font(.subheadline)
                        .fontWeight(.bold)
                }
            }.padding()
            Divider()
        }
        PhotosPicker(selection: $viewModel.selectedImage) {
            VStack {
                if let image = viewModel.profileImage {
                    image
                        .resizable()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                }
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Divider()
            }
        }.padding(.vertical, 8)

        VStack {
            EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
            EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
        }
        Spacer()
    }
}

#Preview {
    EditProfileView(user: UserModel.MOCK_USER[0])
}
