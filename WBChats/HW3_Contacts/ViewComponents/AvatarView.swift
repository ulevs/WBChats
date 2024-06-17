//
//  DefoltAvatarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct AvatarView: View {
    let person: Contact

    var body: some View {
        ZStack {
            switch person.imageName {
            case "none":
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.wbButton)
                        .frame(width: 48, height: 48)
                   
                    Text((String(person.name.first ?? " ") + String(person.surname?.first ?? " ")))
                            .foregroundStyle(.white)
                            .bold()
                }
            default:
                Image(person.imageName)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }

                Circle()
                    .fill(Color.green)
                    .frame(width: 12, height: 12)
                    .overlay(Circle().stroke(.white, lineWidth: 2))
                    .offset(x: 21, y: -21)
                    .opacity(person.isOnline ? 100 : 0)

        }
    }
}


#Preview {
    AvatarView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "person1", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}






