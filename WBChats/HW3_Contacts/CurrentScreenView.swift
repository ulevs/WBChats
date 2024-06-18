//
//  CurrentScreenView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI

struct CurrentScreenView: View {
    var body: some View {
        TabView {
            ContactsView()
                .tag("contacts")
                .tabItem {
                    Image(systemName: "message")
                }
            ChatsView()
                .tag("chats")
            MoreView()
                .tag("more")
        }
    }
}

#Preview {
    CurrentScreenView()
}


