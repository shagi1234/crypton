//
//  TabbarView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct TabbarView: View {
    enum Tab: Int {
        case contacts, chats, calls, settings
    }
    
    @State var selectedTab: Tab = .chats
    @State private var chatBadgeCount = 101
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    
                    ContactListView()
                        .tabItem {
                            Image("tab-item-contacts")
                                .renderingMode(.template)
                            Text("Contacts")
                        }
                        .tag(Tab.contacts)
                    
                    ChatListView()
                        .tabItem {
                            Image("tab-item-chats")
                                .renderingMode(.template)
                            Text("Chats")
                        }
                        .badge(1)
                        .tag(Tab.chats)
                                  
                    CallListView()
                        .tabItem {
                            Image("tab-item-calls")
                                .renderingMode(.template)
                            Text("Calls")
                        }
                        .tag(Tab.calls)
                    
                    ProfileView()
                        .tabItem {
                            Image("tab-item-settings")
                                .renderingMode(.template)
                            Text("Settings")
                        }
                        .tag(Tab.settings)

                }
                .accentColor(Color(red: 1.0, green: 59/255, blue: 48/255))
                .onAppear {
                    UITabBar.appearance().backgroundColor = .white
                    UITabBar.appearance().barTintColor = .white
                }
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

