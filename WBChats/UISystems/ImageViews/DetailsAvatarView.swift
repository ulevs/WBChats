//
//  DetailsAvatarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI


struct DetailsAvatarView: View {
    let person: Contact
    let radius: Float
    
    var body: some View {

        switch person.imageName {
        case "none":
                ZStack {
                    Circle()
                        .fill(Color.wbTintBG)
                        .presentationCornerRadius(CGFloat(radius))
                    Image("noneImage")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.wbHeadlineFont)
                        .frame(width: CGFloat(radius / 2.6), height: CGFloat(radius / 2.3))
                     
                        

                }   .frame(width: CGFloat(radius), height: CGFloat(radius))
        default:
            Image(person.imageName)
                .resizable()
                .frame(width: CGFloat(radius), height: CGFloat(radius))
                .clipShape(Circle())
        }

    }
}



#Preview {
    DetailsAvatarView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "person1", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false), radius: 200)
}
