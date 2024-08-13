//
//  DefoltAvatarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//
import SwiftUI
import Combine

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
    AvatarView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: URL(string: "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LUaiVVLEjwv843DzzydwzrdNf-UA8vuFusn83sNlnt3yShNOs5PtE1tsxv1YteD9RTrkLoDr5PCLle7KXxEEAnMa3rRfkW6BpF2qlN51UN395U74sWBDwCzkZx-JDWfKNNlWVYPQCAROecDXuAMzidCwaPkVOuMQiyP2RrwQanIRKLngpxH3DLTkd~TCgiMphmV4RoijrPkqrOZIJtQIb-mx842kjy1exnF7UxCiWPTdNGxqtY5rF5tqwW9CC93DS38dJN3A1Mvvda4E~oCqvy~dPrWhJiD2kLnfVd5rcSv2YBRXt5vV0SEnUn0-5vtnNuwxysqjSqyvB4uLOsLtjQ__"), phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}

struct Avatar: View {
    let person: Contact
    
    var body: some View {
        Group {
            if let urlString = person.imageName, let url = URL(string: urlString) {
                AsyncImageView(url: url, placeholder: initialsAvatar)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            } else {
                initialsAvatar
            }
        }
    }
    
    private var initialsAvatar: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.wbButton)
                .frame(width: 48, height: 48)
            Text(initials)
                .foregroundStyle(.white)
                .bold()
        }
    }
    
    private var initials: String {
        let nameInitial = person.name.first.map { String($0) } ?? " "
        let surnameInitial = person.surname.first.map { String($0) } ?? " "
        return nameInitial + surnameInitial
    }
}


//struct Avatar: View {
//    let person: Contact
//    
//    var body: some View {
//        Group {
//            switch person.imageName {
//            case nil:
//                initialsAvatar
//            default:
//                imageAvatar
//            }
//        }
//    }
//    
//    private var initialsAvatar: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 16)
//                .fill(Color.wbButton)
//                .frame(width: 48, height: 48)
//            Text(initials)
//                .foregroundStyle(.white)
//                .bold()
//        }
//    }
//    
//    private var imageAvatar: some View {
//        AsyncImage(url: person.imageName, scale: 5)
//            .frame(width: 48, height: 48)
//            .clipShape(RoundedRectangle(cornerRadius: 16))
//    }
//    
//    private var initials: String {
//        let nameInitial = person.name.first.map { String($0) } ?? " "
//        let surnameInitial = person.surname.first.map { String($0) } ?? " "
//        return nameInitial + surnameInitial
//    }
//}


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
