//
//  PersonRowView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 16.06.2024.
//

import SwiftUI

struct PersonRowView: View {
    let person: Contact
    var body: some View {
        HStack {
            AvatarView(person: person)
            
            VStack(alignment: .leading) {
                TextView(text: person.name + " " + (person.surname ?? ""))
                GrayTextView(text: person.isOnline ? "Online" : "Last seen \(person.lastSeen)")
            }
            Spacer()
        }
    }
}

#Preview {
    PersonRowView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "person1", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}
