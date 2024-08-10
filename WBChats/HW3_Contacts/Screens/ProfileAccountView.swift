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
        
            
            HeadlineTitleView(headlineFont: .wbHeadlineFont, title: person.name + " " + (person.surname ))
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
    ProfileAccountView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: URL(string: "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LUaiVVLEjwv843DzzydwzrdNf-UA8vuFusn83sNlnt3yShNOs5PtE1tsxv1YteD9RTrkLoDr5PCLle7KXxEEAnMa3rRfkW6BpF2qlN51UN395U74sWBDwCzkZx-JDWfKNNlWVYPQCAROecDXuAMzidCwaPkVOuMQiyP2RrwQanIRKLngpxH3DLTkd~TCgiMphmV4RoijrPkqrOZIJtQIb-mx842kjy1exnF7UxCiWPTdNGxqtY5rF5tqwW9CC93DS38dJN3A1Mvvda4E~oCqvy~dPrWhJiD2kLnfVd5rcSv2YBRXt5vV0SEnUn0-5vtnNuwxysqjSqyvB4uLOsLtjQ__"), phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}





