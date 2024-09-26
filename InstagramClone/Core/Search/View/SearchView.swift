//
//  SearchView.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 18.09.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color("buttonTextColor"))
                                    Text(user.fullname ?? "")
                                        .foregroundStyle(Color("buttonTextColor"))
                                }.font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }.searchable(text: $searchText, prompt: "Search...")
            }.navigationDestination(for: UserModel.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
