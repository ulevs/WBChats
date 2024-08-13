//
//  ContactModel.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 19.06.2024.
//

import Foundation


struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var imageName: URL?
    var phoneNumber: String
    var isOnline: Bool
    var lastSeen: String
    var hasUnwatchedStories: Bool

}

class MockData {
    static let shared = MockData()
    var index = 0
    let contacts = [
        Contact(name: "Анастасия", surname: "Иванова", imageName: URL(string: "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LUaiVVLEjwv843DzzydwzrdNf-UA8vuFusn83sNlnt3yShNOs5PtE1tsxv1YteD9RTrkLoDr5PCLle7KXxEEAnMa3rRfkW6BpF2qlN51UN395U74sWBDwCzkZx-JDWfKNNlWVYPQCAROecDXuAMzidCwaPkVOuMQiyP2RrwQanIRKLngpxH3DLTkd~TCgiMphmV4RoijrPkqrOZIJtQIb-mx842kjy1exnF7UxCiWPTdNGxqtY5rF5tqwW9CC93DS38dJN3A1Mvvda4E~oCqvy~dPrWhJiD2kLnfVd5rcSv2YBRXt5vV0SEnUn0-5vtnNuwxysqjSqyvB4uLOsLtjQ__"), phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "yesterday", hasUnwatchedStories: false),
        Contact(name: "Петя", surname: "",  imageName: URL(string: "https://s3-alpha-sig.figma.com/img/1fc2/0c81/2121f46e84fc081ac2db4ad8a1450beb?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NyMFgp~qAtV-PbEgeeaWRdjlSljmjeYce9vW9ZycJNZGZdA7yfl0Drr~4PwzTFX5gX6yhUJH1QeENrATW-mOFRb~ROac1HF8sx35ftcs8T~jGjTo1HKUM7hqakS~vq1W6KrxV7HoLDQTox107BvA2oeJqDi0cD1jaktsTZwaw1jXJPuIUhShOWyCMkE160IU12t~zOGILjRzpn~HQbsX277pOhOLhy26qrEyv5r-80KLnzjN8ewd22PBgh-P-Pk9D5EoFRZFEnLvNCi7KJ50SB4py~zRc~ZAMnoRzRNBZ8Mnojcu-F9yG6c3UQmWaZ7R8BTzhWoZrbRCwwVdvn5iDA__"), phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
        Contact(name: "Маман", surname: "", imageName: URL(string: "https://s3-alpha-sig.figma.com/img/fed1/a269/a70ee65e1cab2c63136a619f1b00e1fe?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ERaoX726iRDDNvmePLQX1fg-ytnOdszD68O5-J6EDFd~lEm8z2wziy7bc75wBCnDimX-MGghtz0q4xb5pGArYDQzP28Y~E3ENjKQr5jq8EEykcWT9NJ1z9P~RzBxIw5PlQrGgysTNPtcuRj-rGxkxZHuCQW7HLe53lNhkUAgdUEHD-asdS1egBfLnkIxYVYkjb7XAgkFvnvj20yYBa8d8BAS98v5deNwbyzl7T5pxSMJ3RuPTbxs3AdLf6dmoPhihY6KtNFNFbr~IzqROyjh5p55sWx7MbWSzNGqDRQORDhZY76am~nK7y5lqcYp34TKI2JcvCI1oyuStzm65K9iaw__"), phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "3 hours ago", hasUnwatchedStories: true),
        Contact(name: "Арбуз", surname: "Дыня", imageName: URL(string: "https://s3-alpha-sig.figma.com/img/8ab4/9616/2c4ab2e6878b848cf34cec5937b90ffb?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QvX1ZlzwZqW4NJjRVp7CJAylZ3Di~YSeNpCu-jekdcFEOoiyGze2lDoHFWlBZA-npI7NVtnp32GUVlHPDHE-DN6qiAdMWpgS2-voKuoicpWSUO2-H77brCF2e9UG~mzFkltfrnmKPN2ImUINo3XmZASdbcXR3xMVlfJP7ihaIuc-rLx4G0cL-lzHig-PJJ1OibgcsXxaui-f37YqUh3uA6kwR7cFwRwkmBozkT4O5Yr0diAxlvB7pWLDO8ics9PeT0Deq1Z5aO9h5lOkZYDpsB4ycgqxZI1tVnmf0hCUgN1SMEjQdxFRd~q-3vZDwBUXayJf7ldJRpFV6-xfBvsuYg__"), phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
        Contact(name: "Иван", surname: "Иванов", imageName: nil, phoneNumber: "+7 999 999-99-99", isOnline: true, lastSeen: "", hasUnwatchedStories: false),
        Contact(name: "Лиса", surname: "Алиса", imageName: nil, phoneNumber: "+7 999 999-99-99", isOnline: false, lastSeen: "30 minutes ago", hasUnwatchedStories: true)
    ]
}

