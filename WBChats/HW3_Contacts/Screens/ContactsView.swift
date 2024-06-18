//
//  ContactsView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 15.06.2024.
//

import SwiftUI

//struct ContactsView: View {
//    @State private var tabSelected = 1
//    @State private var searchText = ""
//    var body: some View {
//        NavigationStack{
//            NavigationBarView(title: "Контакты", backButton: true)
//            ContactsRows()
////            CustomTabBarView(tabSelcted: $tabSelected)
////                .navigationTitle("Контакты")
////                .toolbar {
////                    ToolbarItem(placement: .navigationBarLeading) {
////                        TitleView(title: "Контакты")
////                    }
////                    ToolbarItem(placement: .navigationBarTrailing) {
////                        Button(action: {
////                        }) {
////                            Image(systemName: "plus")
////                                .foregroundStyle(.wbHeadlineFont)
////                        }
////                    }}
//                .searchable(text: $searchText)
//                .toolbarRole(.navigationStack)
////                .toolbarRole(.navigationStack) {
////                    NavigationBarView(title: "Контакты", backButton: true)
////                }
//        }
//
//    }
//}


struct ContactsView: View {
    @State private var tabSelected = 1
    @State private var searchText = ""
    var body: some View {
//        NavigationStack{
        VStack {
            NavigationBarView(title: "Контакты", backButton: true)
            TabView {
                ContactsRows()
                    .tag("contacts")
                
            }

                .searchable(text: $searchText)
                .toolbarRole(.navigationStack)
//                .toolbarRole(.navigationStack) {
//                    NavigationBarView(title: "Контакты", backButton: true)
//                }
        }

    }
}

#Preview {
    ContactsView()
}
