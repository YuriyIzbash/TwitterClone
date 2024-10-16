//
//  ContentView.swift
//  TwitterClone
//
//  Created by YURIY IZBASH on 1. 10. 24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        Group {
            // no user loged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have loged in user
                NavigationView {
                    mainInterfaceView
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack (alignment: .topLeading) {
            MainTabView(selectedTab: $selectedTab)
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
                .edgesIgnoringSafeArea(.top) 
        }
        .navigationTitle(selectedTab.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}
enum Tab {
    case home
    case explore
    case messages
    case notifications

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .explore:
            return "Explore"
        case .messages:
            return "Messages"
        case .notifications:
            return "Notifications"
        }
    }
}
