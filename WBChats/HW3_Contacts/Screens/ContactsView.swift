//
//  ContactsView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 15.06.2024.
//

import SwiftUI
import UISystem

struct ContactsView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            ContactsRows()
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        TitleView(headlineFont: .wbHeadlineFont, title: "Контакты")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .foregroundStyle(.wbHeadlineFont)
                        }
                    }
                }
        }
    }
}



#Preview {
    ContactsView()
}
