//
//  PostModel.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import Foundation

struct PostModel: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: UserModel?
}

extension PostModel {
    static var MOCK_POST: [PostModel] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            likes: 123,
            imageUrl: "elephant-1",
            timestamp: Date(),
            user: UserModel.MOCK_USER[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            likes: 34,
            imageUrl: "elephant-2",
            timestamp: Date(),
            user: UserModel.MOCK_USER[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            likes: 6577,
            imageUrl: "elephant-3",
            timestamp: Date(),
            user: UserModel.MOCK_USER[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            likes: 66656,
            imageUrl: "elephant-4",
            timestamp: Date(),
            user: UserModel.MOCK_USER[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            likes: 3,
            imageUrl: "elephant-5",
            timestamp: Date(),
            user: UserModel.MOCK_USER[4]
        ),
    ]
}
