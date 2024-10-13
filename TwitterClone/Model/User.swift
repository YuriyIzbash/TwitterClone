//
//  User.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 12. 10. 24.
//

import Firebase
import FirebaseFirestore

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
