//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 21.09.2024.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var users = [UserModel]()
    
    init(){
        Task{ try await fetchAllUsers()}
    }
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService.fecthAllUsers()
        
    }
}
