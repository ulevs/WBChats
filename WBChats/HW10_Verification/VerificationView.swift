//
//  VerificationView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 19.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State private var contact = VerificationModel(phoneNumber: "", code: "4444")
    @State private var showVerificationCodeView: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                BallAnimation()
                
                HeadlineTitleView(title: "Enter your phone number")
                    .padding()

                TextView(text: "We will send a confirmation code to the number provided")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                    .lineSpacing(7)
                

                NumberView(contact: $contact)

                Spacer()

                ButtonWBView(title: "Continue", action: {
                    if contact.phoneNumber.count == 13 { showVerificationCodeView.toggle() }})
            }
            .navigationDestination(isPresented: $showVerificationCodeView) {
                VerificationCodeView(contact: $contact)
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
            .padding()
            .background(Color(.wbBG))
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
