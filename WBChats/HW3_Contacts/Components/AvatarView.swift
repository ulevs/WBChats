//
//  DefoltAvatarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//
import SwiftUI
import Combine

//struct AvatarView: View {
//    let person: Contact
//    @StateObject private var loader = ImageLoader()
//    
//    var body: some View {
//        ZStack {
//            StoryFrame()
//                .opacity(person.hasUnwatchedStories ? 100 : 0)
////            AsyncAvatar(person: person)
////            Avatar(person: person)
//            if let url = person.imageName {
//    //            ZStack {
//                    if let image = loader.image {
//                        Image(uiImage: image)
//                            .resizable()
//                            .scaledToFit()
//                    } else {
//                        TextAvatar(person: person)
//                    }
//    //            }
//            } else {
//                TextAvatar(person: person)
//            }
//
//            Circle()
//                .fill(Color.green)
//                .frame(width: 12, height: 12)
//                .overlay(Circle().stroke(.white, lineWidth: 2))
//                .offset(x: 21, y: -21)
//                .opacity(person.isOnline ? 100 : 0)
//                    
//
//        }
//    }
//}
struct AvatarView: View {
    let person: Contact
    @StateObject private var loader = ImageLoader()

    var body: some View {
        ZStack {
            StoryFrame()
                .opacity(person.hasUnwatchedStories ? 1 : 0) // Заменено 100 на 1 для правильного значения opacity
            if let url = person.imageName {
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            loader.loadImage(from: url) // Запускаем загрузку изображения
                        }
                } else {
                    TextAvatar(person: person)

                }
            } else {
                TextAvatar(person: person)
            }

            Circle()
                .fill(Color.green)
                .frame(width: 12, height: 12)
                .overlay(Circle().stroke(.white, lineWidth: 2))
                .offset(x: 21, y: -21)
                .opacity(person.isOnline ? 1 : 0) // Заменено 100 на 1 для правильного значения opacity
        }
    }
}

#Preview {
    AvatarView(person: Contact(name: "Анастасия", surname: "Иванова", imageName: URL(string: "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LUaiVVLEjwv843DzzydwzrdNf-UA8vuFusn83sNlnt3yShNOs5PtE1tsxv1YteD9RTrkLoDr5PCLle7KXxEEAnMa3rRfkW6BpF2qlN51UN395U74sWBDwCzkZx-JDWfKNNlWVYPQCAROecDXuAMzidCwaPkVOuMQiyP2RrwQanIRKLngpxH3DLTkd~TCgiMphmV4RoijrPkqrOZIJtQIb-mx842kjy1exnF7UxCiWPTdNGxqtY5rF5tqwW9CC93DS38dJN3A1Mvvda4E~oCqvy~dPrWhJiD2kLnfVd5rcSv2YBRXt5vV0SEnUn0-5vtnNuwxysqjSqyvB4uLOsLtjQ__"), phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false))
}

//if let avatarURL = contact.avatar {
//               if let image = imageLoader.image {
//                   Image(uiImage: image)
//                       .resizable()
//                       .aspectRatio(contentMode: .fill)
//                       .frame(width: 48, height: 48)
//                       .cornerRadius(16)
//                       .padding(2)
//                       .overlay(StoryOverlay(contact: contact))
//                       .overlay(StatusOverlay(contact: contact))
//               } else {
//                   textAvatar(contact: contact)
//                       .onAppear {
//                           imageLoader.loadImage(from: avatarURL)
//                       }
//               }
//           } else {
//               textAvatar(contact: contact)
//           }
//struct AsyncAvatar: View {
//    @StateObject private var loader = ImageLoader()
//    var person: Contact
////    let url: URL?
////    let placeholder: Image
//    
//    var body: some View {
//        if let url = person.imageName {
////            ZStack {
//                if let image = loader.image {
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFit()
//                } else {
//                    TextAvatar(person: person)
//                }
////            }
//        } else {
//            TextAvatar(person: person)
//        }
//    }
//}
struct TextAvatar: View {
    var person: Contact

    var initials: String {
        let firstInitial = person.name.first.map { String($0) } ?? " "
        let surnameInitial = person.surname.first.map { String($0) } ?? " "
        return firstInitial + surnameInitial
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.wbButton)
                .frame(width: 48, height: 48)
            Text(initials)
                .foregroundStyle(.white)
                .bold()
        }
    }
}


//struct Avatar: View {
//    let person: Contact
//    
//    var body: some View {
//        //        Group {
//        //            if let urlString = person.imageName, let url = URL(string: urlString) {
//        //                AsyncImageView(url: url, placeholder: initialsAvatar)
//        //                    .frame(width: 48, height: 48)
//        //                    .clipShape(RoundedRectangle(cornerRadius: 16))
//        //            } else {
//        //                initialsAvatar
//        //            }
//        //        }
//        //    }
////        if let urlString = person.imageName {
////            AsyncImage(url: urlString) { image in
////                image
////                    .resizable()
////                    .frame(width: 262, height: 271)
////                    .padding(.top, 135)
////            } placeholder: {
////                Image("Cat")
////                    .resizable()
////                    .frame(width: 262, height: 271)
////                    .padding(.top, 135)
////            }
////        } else {
////            Image("Cat")
////                .resizable()
////                .frame(width: 262, height: 271)
////                .padding(.top, 135)
////        }
//
//
//            if let urlString = person.imageName {
//                AsyncImage(url: urlString)
//                    .frame(width: 48, height: 48)
//                    .clipShape(RoundedRectangle(cornerRadius: 16))
//            }else {
//                initialsAvatar
//            }
//
////        
//        var initialsAvatar: some View {
//            ZStack {
//                RoundedRectangle(cornerRadius: 16)
//                    .fill(Color.wbButton)
//                    .frame(width: 48, height: 48)
//                Text(initials)
//                    .foregroundStyle(.white)
//                    .bold()
//            }
//        }
//        
//       var initials: String {
//            let nameInitial = person.name.first.map { String($0) } ?? " "
//            let surnameInitial = person.surname.first.map { String($0) } ?? " "
//            return nameInitial + surnameInitial
//        }
//    }
//
////    struct TextAvatar: View {
////        var person: Contact
//////        private let dateFormatter: DateFormatter = {
//////            let formatter = DateFormatter()
//////            formatter.dateStyle = .short
//////            return formatter
//////        }()
////        
////        var body: some View {
////            ZStack {
////                RoundedRectangle(cornerRadius: 16)
////                    .fill(Color.wbButton)
////                    .frame(width: 48, height: 48)
////                Text((String(person.name.first ?? " ") + String(person.surname?.first ?? " ")))
////                        .foregroundStyle(.white)
////                        .bold()
////            }
//////            VStack(alignment: .leading, spacing: 8) {
//////                Text(contact.firstName + " " + contact.lastName)
//////                    .font(.subheadline)
//////                    .bold()
//////                    .foregroundStyle(.wbFont)
//////                Text(contact.isOnline ? "Online" : "\("contacts_lastSeen".localized()) \(contact.lastVisit, formatter: dateFormatter)")
//////                    .font(.footnote)
//////                    .foregroundStyle(.wbDisable)
//////                    .lineLimit(1)
//////            }
//////            .padding(.top, 6)
////        }
////    }
////struct Avatar: View {
////    let person: Contact
////    
////    var body: some View {
////        Group {
////            switch person.imageName {
////            case nil:
////                initialsAvatar
////            default:
////                imageAvatar
////            }
////        }
////    }
////    
////    private var initialsAvatar: some View {
////        ZStack {
////            RoundedRectangle(cornerRadius: 16)
////                .fill(Color.wbButton)
////                .frame(width: 48, height: 48)
////            Text(initials)
////                .foregroundStyle(.white)
////                .bold()
////        }
////    }
////    
////    private var imageAvatar: some View {
////        AsyncImage(url: person.imageName, scale: 5)
////            .frame(width: 48, height: 48)
////            .clipShape(RoundedRectangle(cornerRadius: 16))
////    }
////    
////    private var initials: String {
////        let nameInitial = person.name.first.map { String($0) } ?? " "
////        let surnameInitial = person.surname.first.map { String($0) } ?? " "
////        return nameInitial + surnameInitial
////    }
////}
//

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

