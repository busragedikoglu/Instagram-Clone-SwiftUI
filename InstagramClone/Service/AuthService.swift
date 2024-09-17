//
//  AuthService.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 17.09.2024.
//

import FirebaseAuth
import Foundation

class AuthService: ObservableObject {
    @Published var isCurrentUser: Bool = false

    init() {
        checkUserSession()
    }

    func checkUserSession() {
        if Auth.auth().currentUser != nil {
            isCurrentUser = true
        } else {
            isCurrentUser = false
        }
    }

    func signUpClicked(email: String, password: String,completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in

            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            if let authResult = authResult {
                print(authResult.user.uid)
                self.isCurrentUser = true
                completion(true)
            }
        }
    }

    func signInClicked(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }

            if let authResult = authResult {
                print(authResult.user.uid)
                let userID = authResult.user.uid
                self.isCurrentUser = true
                completion(userID)
            } else {
                completion(nil)
            }
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            isCurrentUser=false
        }catch let signOutError as NSError{
            print("Error signing out: \(signOutError)")
        }
    }
}
