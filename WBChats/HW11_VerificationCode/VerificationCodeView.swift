//
//  VerificationCodeView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 29.07.2024.
//

import SwiftUI
//
//struct VerificationCodeView: View {
//    let number: String
////    @State private var showVerificationCodeView: Bool = false
//    @Environment(\.presentationMode) var presentationMode
//    @State private var enteredCode: String = ""
//    let verificationModel = VerificationModel(phoneNumber: "", code: "")
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            HeadlineTitleView(title: "Enter a code")
//                .padding()
//            
//            TextView(text: "Sent a code to the number")
//            TextView(text: verificationModel.phoneNumber)
//                .multilineTextAlignment(.center)
//                .padding(.bottom, 40)
//                .padding(.top, 7)
//            
//            
//            CodeView(code: verificationModel.code, enteredCode: $enteredCode)
//                .padding(.bottom, 20)
//            
//            Button(action: {
//                // Resend code action
//            }) {
//                Text("Запросить код повторно")
//                    .foregroundStyle(.wbDefault)
//            }
//            .padding(.bottom, 50)
//            
//            Spacer()
////            ButtonWBView(title: "Continue", action: {showVerificationCodeView.toggle()})
//            
//        }
//       
//        .navigationBarBackButtonHidden()
//        .navigationBarItems(
//                        leading: Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                                Image(systemName: "chevron.left")
//                                .bold()
//                                .foregroundStyle(.wbHeadlineFont)
//                        })
//        .padding(.all, 10)
//        .background(Color(.wbBG))
//    }
//}
struct VerificationCodeView: View {
    @Binding var contact: VerificationModel
    @State private var showContactsView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var enteredCode: String = ""

    var body: some View {
        VStack {
            Spacer()
            HeadlineTitleView(title: "Enter a code")
                .padding()

            TextView(text: "Sent a code to the number")
            TextView(text: contact.phoneNumber)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .padding(.top, 7)

            CodeView(code: contact.code, enteredCode: $enteredCode, showNextScreen: $showContactsView)
                .padding(.bottom, 20)

            Button(action: {
                // Resend code action
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
//    func codeVerification() {
//        if enteredCode == "4444" {
//            showContactsView.toggle()
//        }
//    }
}
