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
//            NavigationBarView(title: "Профиль", backButton: true)
//                .padding(.top)
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
//        .navigationTitle("Профиль")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                                Image(systemName: "chevron.left")
                                .bold()
                                .foregroundStyle(.wbHeadlineFont)
    
                        },
                        trailing: Button(action: {
                            // Действие для кнопки редактирования
                        }) {
                            Image(systemName: "pencil")
//                                    .bold()
                                .foregroundStyle(.wbHeadlineFont)
                        }
                    )
        .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            TitleView(title: "Профиль")
//                                .font(.headline)
//                                .foregroundColor(Color.purple) // Цвет заголовка
                        }
                    }
//        .toolbar {
           
            // Добавляем свою кнопку в навигационный бар
//            ToolbarItem() {
//                HStack {
//                Button(action: {
//                    // Действие для возврата назад
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "chevron.left") // Ваша иконка
//                        .foregroundStyle(.wbHeadlineFont) // Цвет иконки
//                }
//                    
//                    Text("Профиль")
//                    Spacer()
//                    Button(action: {
//                        // Действие для возврата назад
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image(systemName: "chevron.left") // Ваша иконка
//                            .foregroundStyle(.wbHeadlineFont) // Цвет иконки
//                    }
//            }
//        }
//        }
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
