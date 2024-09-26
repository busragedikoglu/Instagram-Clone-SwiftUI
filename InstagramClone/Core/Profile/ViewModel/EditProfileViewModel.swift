//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 21.09.2024.
//

import Firebase
import Foundation
import PhotosUI
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: UserModel

    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadIamge(fromItem: selectedImage) }}
    }

    @Published var profileImage: Image?

    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage:UIImage?

    init(user: UserModel) {
        self.user = user
    }

    func loadIamge(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage{
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname{
            data["fullname"] = fullname
        }
        if !bio.isEmpty && user.bio != bio{
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
