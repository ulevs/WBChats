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
            StoryFrame()
                .opacity(person.hasUnwatchedStories ? 100 : 0)
            Avatar(person: person)
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
    AvatarView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "person1", phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "yesterday", hasUnwatchedStories: true))
}





struct Avatar: View {
    let person: Contact
    var body: some View {
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
    }
}

struct StoryFrame: View {
    let gradient = Gradient(colors: [.wbStart,  .wbEnd])
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(LinearGradient(gradient: gradient, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .frame(width: 56, height: 56)
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.wbBG)
                .frame(width: 52, height: 52)
        }
    }
}
