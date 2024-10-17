//
//  Tweet.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 15. 10. 24.
//

import Firebase
import FirebaseFirestore

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
