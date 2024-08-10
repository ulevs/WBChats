//
//  NewContactView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 10.08.2024.
//

import SwiftUI
import UISystem

struct NewContactView: View {
    @State private var contact = Contact(name: "", surname: "", imageName: nil, phoneNumber: "", isOnline: false, lastSeen: "", hasUnwatchedStories: false)

    @State private var twitter: String = ""
    @State private var instagram: String = ""
    @State private var linkedin: String = ""
    @State private var facebook: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // Навигационный бар
            HStack {
                Button(action: {
                    // Действие при нажатии на кнопку "назад"
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Новый контакт")
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
                Spacer()
            }
            .padding()
            
            VStack(spacing: 16) {
                ZStack {
                    DetailsAvatarView(photo: contact.imageName, radius: 100, tintColor: .wbTintBG, fontColor: .wbHeadlineFont)

                    Button(action: {
      
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.wbHeadlineFont)
                    }
                    .offset(x: 35, y: 35)
//                    Image(systemName: "plus.circle.fill")
//                        .foregroundStyle(.wbHeadlineFont)
//                        .offset(x: 35, y: 35)

                }
                
                TextFieldWB(title: "Имя (обязательно)", text: $contact.name)
                TextFieldWB(title: "Фамилия (опционально)", text: $contact.surname)
                NumberView(number: $contact.phoneNumber)
                TextFieldWB(title: "twitter", text: $twitter)
                TextFieldWB(title:"@instagram", text: $instagram)
                TextFieldWB(title: "linkedin", text: $linkedin)
                TextFieldWB(title:"facebook/profile", text: $facebook)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
    
            ButtonWBView(title: "Сохранить", action: {}, buttonColor: .wbButton)
    
//            .padding(.horizontal, 20)
//            .padding(.bottom, 30)
        }
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView()
            .previewDevice("iPhone 14")
    }
}

struct TextFieldWB: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .bold()
            .padding(7)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.wbTintBG)
            )
    }
}
