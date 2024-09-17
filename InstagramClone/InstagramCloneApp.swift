//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Büşra Gedikoğlu on 16.09.2024.
//

import Firebase
import SwiftUI

@main
struct InstagramCloneApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
