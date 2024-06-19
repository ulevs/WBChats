//
//  CurrentScreenView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI

struct CurrentScreenView: View {
    @State private var searchText = ""
    var body: some View {
        TabView {
            ContactsView()
                .tag("contacts")
                .tabItem {
                    Image("user")
                }
            ChatsView()
                .tag("chats")
                .tabItem {
                    Image("message")
                }
            MoreView()
                .tag("more")
                .tabItem {
                    Image("menu")
                }
        }
    }
}

#Preview {
    CurrentScreenView()
}


