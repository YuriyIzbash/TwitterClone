//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 11. 10. 24.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account.", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                Image("plus_photo")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
        
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
