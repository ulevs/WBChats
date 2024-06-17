//
//  ContactRow.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct ContactRows: View {
    @State private var isPresented = false
    var body: some View {
        
        List(contacts) { contact in
//            Button(action:{ isPresented.toggle() }) {
//            NavigationLink(
                HStack {
                    AvatarView(person: contact)
                    
                    VStack(alignment: .leading) {
                        TextView(text: contact.name + " " + (contact.surname ?? ""))
                        
                        GrayTextView(text: contact.isOnline ? "Online" : "Last seen \(contact.lastSeen)")
                    }
                    
                    Spacer()
                    
                }
                .padding(.vertical, 4)
//            }
//            .sheet(isPresented: $isPresented) {
//                ProfileAccountView(person: contact)
//            }
//                destination: ProfileAccountView(person: contact)
//                )
        }
        .listStyle(.plain)
    }
}
#Preview {
    ContactRows()
}



struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let surname: String?
    let imageName: String
    let phoneNumber: String
//    let status: String
    let isOnline: Bool
    let lastSeen: String
    let hasUnwatchedStories: Bool
//    let unreadMessages: Int?
}
//struct Contacts {
//    let name: String
//    let surname: String?
//    let phoneNumber: String
//    var lastSeen: Date?
//    var isOnline: Bool
//    var isStoryPublished: Bool
////    var hasAvatar: Bool"
//    var avatar: String?
//}

let contacts = [
    Contact(name: "Анастасия", surname: "Иванова", imageName: "person1", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false),
    Contact(name: "Петя", surname: nil,  imageName: "person2", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
    Contact(name: "Маман", surname: nil, imageName: "person3", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "3 hours ago", hasUnwatchedStories: true),
    Contact(name: "Арбуз", surname: "Дыня", imageName: "person4", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
    Contact(name: "Иван", surname: "Иванов", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
    Contact(name: "Лиса", surname: "Алиса", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "30 minutes ago", hasUnwatchedStories: true)
]



//
//struct ContactRow: View {
//    let contact: Contact
//    
//    var body: some View {
////        NavigationStack {
//            List(contacts) { contact in
//                HStack {
//                    
//                    AvatarView(person: contact)
//                    VStack(alignment: .leading) {
//                        Text(contact.name + " " + (contact.surname ?? ""))
//                            .font(.headline)
//                        Text(contact.isOnline ? "Online" : "Last seen \(contact.lastSeen)")
//                            .font(.subheadline)
//                            .foregroundColor(contact.isOnline ? .green : .gray)
//                    }
//                    
//                    Spacer()
//                    
//                }
//                .padding(.vertical, 4)
//            }
//            .listStyle(.plain)
//        }
////    }
//}
////#Preview {
////    ContactRow(contact: contacts.first!)
////}
