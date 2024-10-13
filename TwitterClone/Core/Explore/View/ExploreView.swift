//
//  ExploreView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 1. 10. 24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 25, id: \.self) { _ in
                        NavigationLink {
//                                ProfileView()
                        } label: {
                            UserRowView()
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
