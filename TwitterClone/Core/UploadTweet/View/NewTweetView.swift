//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 2. 10. 24.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }

                // Custom text input with placeholder
                ZStack(alignment: .topLeading) {
                   // Placeholder text
                    if caption.isEmpty {
                        Text("What's happening?")
                            .foregroundColor(.gray)
                            .padding(.leading, 12)
                            .padding(.top, 12)
                    }

                    // TextEditor for input
                    TextEditor(text: $caption)
                        .padding(4)
                        .frame(minHeight: 150, alignment: .leading)
                        .background(Color.clear)
                        .cornerRadius(8)
                        .opacity(caption.isEmpty ? 0.25 : 1)
                }
            }
            .padding()
            
            Spacer()
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    NewTweetView()
}
