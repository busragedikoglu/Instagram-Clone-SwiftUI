//
//  FeedView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(PostModel.MOCK_POST) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }.navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("Instagram")
                            .resizable()
                            .frame(maxWidth: 100, maxHeight: 32)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                }
        }
    }
}

#Preview {
    FeedView()
}
