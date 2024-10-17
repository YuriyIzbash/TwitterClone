//
//  User.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 12. 10. 24.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
