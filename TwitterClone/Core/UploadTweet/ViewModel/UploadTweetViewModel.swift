//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 15. 10. 24.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                print("DEBUG: Failed to upload tweet")
            }
        }
    }
}
