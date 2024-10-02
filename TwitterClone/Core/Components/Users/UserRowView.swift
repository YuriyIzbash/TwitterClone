//
//  UserRowView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 2. 10. 24.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Username")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Full Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
