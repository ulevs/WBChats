//
//  ChatsView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI
import UISystem

struct ChatsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("There will be chats here")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TitleView(headlineFont: .wbHeadlineFont, title: "Чаты")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .bold()
                            .foregroundStyle(.wbHeadlineFont)
                    }
                }
            }
            
    }
}
#Preview {
    ChatsView()
}
