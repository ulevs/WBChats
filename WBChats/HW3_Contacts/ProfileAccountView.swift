//
//  ProfileAccountView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 15.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    let person: Contact
    var body: some View {
        VStack {
            NavigationBarView(title: "Профиль", backButton: true)
                .padding(.top)
            DetailsAvatarView(person: person, radius: 200)
            
            HeadlineTitleView(title: person.name + " " + (person.surname ?? ""))
                .padding(.top, 20)
            Text(person.phoneNumber)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            
            HStack {
                SocialButton(iconName: "twitter", action: {})
                SocialButton(iconName: "instagram", action: {})
                SocialButton(iconName: "linkedin", action: {})
                SocialButton(iconName: "facebook", action: {})
            }
            .padding(.top, 40)
            
            
        }
    }
}

#Preview {
    ProfileAccountView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}




struct SocialButton: View {
    let iconName: String
    let action: ()->()
    
    var body: some View {
        Button(action: action) {
            Image(iconName)
                .padding()
        }
        .frame(height: 40)
        .padding(.horizontal)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(Color.wbDefault, lineWidth: 2)
        )
    }
}
