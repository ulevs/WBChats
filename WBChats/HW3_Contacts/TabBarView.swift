//
//  CurrentScreenView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI
import UISystem

struct TabBarView: View {
    @State private var addNewContact = false
    @State private var searchText = ""
    var body: some View {
//        NavigationStack {
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
            .navigationBarBackButtonHidden()
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    TitleView(headlineFont: .wbHeadlineFont, title: "Контакты")
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {addNewContact.toggle()}) {
//                        Image(systemName: "plus")
//                            .bold()
//                            .foregroundStyle(.wbHeadlineFont)
//                    }
//                }
//            }
//
////        }
//        .navigationDestination(isPresented: $addNewContact, destination: {
//            NewContactView()
//        })
    }
}

#Preview {
    TabBarView()
}



