//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 1. 10. 24.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                // user info and tweeet caption
                VStack(alignment: .leading, spacing: 4) {
                    // user info
                    HStack {
                        Text("User Name")
                            .font(.subheadline).bold()
                        Text("@user_name")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //tweet caption
                    Text("I write something here..")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            // action buttons
            
            HStack {
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

#Preview {
    TweetRowView()
}
