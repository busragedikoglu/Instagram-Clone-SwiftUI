//
//  UserService.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 21.09.2024.
//

import Firebase
import Foundation

struct UserService {
    @MainActor
    static func fecthAllUsers() async throws -> [UserModel] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: UserModel.self)})
    }
}
