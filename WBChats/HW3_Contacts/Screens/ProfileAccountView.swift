//
//  ProfileAccountView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 15.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
      
    let person: Contact
    var body: some View {
        VStack {
            DetailsAvatarView(person: person, radius: 200)
            
            HeadlineTitleView(title: person.name + " " + (person.surname ?? ""))
                .padding(.top, 20)
            Text(person.phoneNumber)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            
            HStack {
                SocialButtonView(iconName: "twitter", action: {})
                SocialButtonView(iconName: "instagram", action: {})
                SocialButtonView(iconName: "linkedin", action: {})
                SocialButtonView(iconName: "facebook", action: {})
            }
            .padding(.top, 40)
            
            
        }
        
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                                Image(systemName: "chevron.left")
                                .bold()
                                .foregroundStyle(.wbHeadlineFont)
    
                        },
                        trailing: Button(action: {}) {
                            Image(systemName: "pencil")
                                    .bold()
                                .foregroundStyle(.wbHeadlineFont)
                        }
                    )
        .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            TitleView(title: "Профиль")
                        }
                    }
    }
}

#Preview {
    ProfileAccountView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}





