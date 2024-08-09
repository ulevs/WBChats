//
//  ContactModel.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 19.06.2024.
//

import Foundation

// ContactModel.swift

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let surname: String?
    let imageName: String
    let phoneNumber: String
    let isOnline: Bool
    let lastSeen: String
    let hasUnwatchedStories: Bool
//    let unreadMessages: Int?
}

class MockData {
    static let shared = MockData()
    var index = 0
    let contacts = [
        Contact(name: "Анастасия", surname: "Иванова", imageName: "person1", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false),
        Contact(name: "Петя", surname: nil,  imageName: "person2", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
        Contact(name: "Маман", surname: nil, imageName: "person3", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "3 hours ago", hasUnwatchedStories: true),
        Contact(name: "Арбуз", surname: "Дыня", imageName: "person4", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
        Contact(name: "Иван", surname: "Иванов", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
        Contact(name: "Лиса", surname: "Алиса", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "30 minutes ago", hasUnwatchedStories: true)
    ]
}



