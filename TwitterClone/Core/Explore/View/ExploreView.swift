//
//  ExploreView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 1. 10. 24.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExploreView()
}
