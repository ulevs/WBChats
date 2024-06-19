//
//  ContactRow.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct ContactsRows: View {
    
    var body: some View {
        List(MockData.contacts) { contact in
            NavigationLink(destination: ProfileAccountView(person: contact)
            ) {
                PersonRowView(person: contact)
            }
                .padding(.vertical, 4)
        }
        .listStyle(.plain)
    }
}
#Preview {
    ContactsRows()
}
