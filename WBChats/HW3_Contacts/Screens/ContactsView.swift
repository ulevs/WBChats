//
//  ContactsView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 15.06.2024.
//

import SwiftUI
import UISystem

struct ContactsView: View {
    @State private var addNewContact = false
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            ContactsRows()
//                .searchable(text: $searchText)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        TitleView(headlineFont: .wbHeadlineFont, title: "Контакты")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {addNewContact.toggle()}) {
                            Image(systemName: "plus")
                                .bold()
                                .foregroundStyle(.wbHeadlineFont)
                        }
                    }
                }
                .navigationDestination(isPresented: $addNewContact, destination: {
                    NewContactView()
                })
        }
    }
}



#Preview {
    ContactsView()
}
//import SwiftUI
//import UISystem
//
//struct ContactsView: View {
//    
//    @State private var addNewContact = false
//    @State var contactSearch = ""
//    @State var contactPath = [Contact]()
//    
//    var body: some View {
//        ZStack {
//            
//            NavigationStack(path: $contactPath) {
//                ContactsRows()
//                    .padding(.top, 12)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            TitleView(headlineFont: .wbHeadlineFont, title: "Контакты")
//                        }
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Button(action: {addNewContact.toggle()}) {
//                                Image(systemName: "plus")
//                                    .bold()
//                                    .foregroundStyle(.wbHeadlineFont)
//                            }
//                        }
//                    }
//                    .navigationDestination(isPresented: $addNewContact, destination: {
//                        NewContactView()
//                    })
//            }
//        }
//    }
//}
//
//#Preview {
//    ContactsView()
//}
