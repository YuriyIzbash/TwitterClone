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
    
    func fetchTweets(complition: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            complition(tweets)
        }
    }
}
