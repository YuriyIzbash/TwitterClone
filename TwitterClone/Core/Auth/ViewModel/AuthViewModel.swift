//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 11. 10. 24.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email: \(email)")
    }
    
    func register(withEmail email: String, password: String, username: String, fullname: String) {
        print("DEBUG: Register with email: \(email)")
    }
}
