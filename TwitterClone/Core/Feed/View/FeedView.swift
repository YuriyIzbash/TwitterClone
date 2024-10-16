//
//  FeedView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 1. 10. 24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                }
                .padding(.top, 16)
            }
            .padding(.top, 1)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
         
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
        .edgesIgnoringSafeArea(.bottom) // Ensure we ignore only the bottom area for floating button, not top
        .onAppear {
            // Reset or enforce layout conditions when returning to the view
            UIApplication.shared.windows.first?.rootViewController?.additionalSafeAreaInsets.top = 0
        }
    }
}
