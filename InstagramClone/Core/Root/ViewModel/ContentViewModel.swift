//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 20.09.2024.
//

import FirebaseAuth
import Foundation
import Combine

class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    init(){
        setupSubscibers()
    }

    func setupSubscibers() {
        service.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink{[weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
        
    }
}
