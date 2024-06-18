//
//  SearchBarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 18.06.2024.
//

import SwiftUI

struct SearchBarView: View {
        @State private var searchText = ""
        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
//                    .foregroundColor(Color(red: 173/255, green: 181/255, blue: 189/255))
                TextField("Поиск", text: $searchText)
                    .disableAutocorrection(true)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .cornerRadius(4)
            .background(Color.wbTintBG)
            .frame(width: 327, height: 36)
        }
}

#Preview {
    SearchBarView()
}
