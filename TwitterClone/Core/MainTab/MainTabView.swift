//
//  MainTabView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 1. 10. 24.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        TabView(selection: $selectedTab) { // Use selectedTab instead of selectedIndex
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tab.home) // Use enum case instead of integers
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Tab.explore)
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(Tab.notifications)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(Tab.messages)
        }
    }
}

#Preview {
    MainTabView(selectedTab: .constant(.home)) // Use a constant binding for preview
}
