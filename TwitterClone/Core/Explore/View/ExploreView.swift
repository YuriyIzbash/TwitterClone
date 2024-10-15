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
            SearchBar(text: $viewModel.searchText)
                .padding()
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
