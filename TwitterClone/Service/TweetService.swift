//
//  TweetService.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 15. 10. 24.
//

import Firebase
import FirebaseAuth

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["caption": caption,
                    "uid": uid,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Error uploading tweet: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
}
