//
//  ContactRow.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct ContactsRows: View {
    
    var body: some View {
        List(MockData.shared.contacts) { contact in
            ZStack {
                PersonRowView(person: contact)
                
                NavigationLink(destination: ProfileAccountView(person: contact)
                ) { }
                .opacity(0)
                .padding(.vertical, 4)
            }
        }
        .listStyle(.plain)
    }
}
#Preview {
    ContactsRows()
}
