//
//  VerificationCodeView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 29.07.2024.
//

import SwiftUI
import UISystem

struct VerificationCodeView: View {
    @Binding var contact: VerificationModel
    @State private var showContactsView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var enteredCode: String = ""
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack {
            Spacer()
            HeadlineTitleView(headlineFont: .wbHeadlineFont, title: "Enter a code")
                .padding()

            TextView(headlineFont: .wbHeadlineFont, text: "Sent a code to the number")
            TextView(headlineFont: .wbHeadlineFont, text: contact.phoneNumber)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .padding(.top, 7)

            CodeView(code: contact.code, enteredCode: $enteredCode, showNextScreen: $showContactsView)
                .padding(.bottom, 20)

            Button(action: {
                // 
            }) {
                Text("Запросить код повторно")
                    .foregroundStyle(.wbDefault)
            }
            .padding(.bottom, 50)
            Spacer()
        }
        .navigationDestination(isPresented: $showContactsView) {
            CurrentScreenView()
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                                Image(systemName: "chevron.left")
                                .bold()
                                .foregroundStyle(.wbHeadlineFont)
                        })
        .padding(.all, 10)
        .background(Color(.wbBG))
    }
}

//struct VerificationCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerificationCodeView(contact: Binding<VerificationModel>)
//    }
//}
