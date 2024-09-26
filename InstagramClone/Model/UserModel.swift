//
//  UserModel.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import Foundation
import FirebaseAuth

struct UserModel: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser:Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
    
}

extension UserModel {
    static var MOCK_USER: [UserModel] = [
        .init(id: UUID().uuidString, username: "elephant1", profileImageUrl: "elephant-1", fullname: "Elephant 1", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "elephant1@gmail.com"),
        .init(id: UUID().uuidString, username: "elephant2", profileImageUrl: "elephant-2", fullname: "Elephant 2", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "elephant2@gmail.com"),
        .init(id: UUID().uuidString, username: "elephant3", profileImageUrl: "elephant-3", fullname: "Elephant 3", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "elephant3@gmail.com"),
        .init(id: UUID().uuidString, username: "elephant4", profileImageUrl: "elephant-4", fullname: "Elephant 4", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "elephant4@gmail.com"),
        .init(id: UUID().uuidString, username: "elephant5", profileImageUrl: "elephant-5", fullname: "Elephant 5", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "elephant5@gmail.com"),
    ]
}
