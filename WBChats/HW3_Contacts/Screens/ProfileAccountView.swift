//
//  ProfileAccountView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 15.06.2024.
//

import SwiftUI
import UISystem

struct ProfileAccountView: View {
    @Environment(\.presentationMode) var presentationMode
      
    let person: Contact
    var body: some View {
        VStack {
            DetailsAvatarView(photo: person.imageName, radius: 200, tintColor: .wbTintBG, fontColor: .wbHeadlineFont)
        
            
            HeadlineTitleView(headlineFont: .wbHeadlineFont, title: person.name + " " + (person.surname ?? ""))
                .padding(.top, 20)
            Text(person.phoneNumber)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            
            HStack {
                SocialButtonView(iconName: "twitter", action: {}, buttonColor: .wbButton)
                SocialButtonView(iconName: "instagram", action: {}, buttonColor: .wbButton)
                SocialButtonView(iconName: "linkedin", action: {}, buttonColor: .wbButton)
                SocialButtonView(iconName: "facebook", action: {}, buttonColor: .wbButton)
            }
            .padding(.top, 40)
            
            
        }
        
        
        .navigationBarBackButtonHidden()
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
                            TitleView(headlineFont: .wbHeadlineFont, title: "Профиль")
                        }
                    }
        .background(Color(.wbBG))
    }
    
}

#Preview {
    ProfileAccountView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: "none", phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}





