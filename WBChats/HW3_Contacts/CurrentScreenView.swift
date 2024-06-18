//
//  CurrentScreenView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI

struct CurrentScreenView: View {
    var body: some View {
//        NavigationStack {
            TabView {
                ContactsView()
                    .tag("contacts")
                    .tabItem {
                        Image("user")
                            .foregroundStyle(.yellow)
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
            
//            .navigationTitle("Контакты")
//           
//        }
        
    }
}

#Preview {
    CurrentScreenView()
}


