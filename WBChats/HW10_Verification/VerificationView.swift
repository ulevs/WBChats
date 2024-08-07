//
//  VerificationView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 19.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State private var phoneNumber: String = ""
    @State private var isProcessing: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HeadlineTitleView(title: "Enter your phone number")
                .padding()
            
            TextView(text: "We will send a confirmation code to the number provided")
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .lineSpacing(7)

            
            HStack {
                Image(systemName: "")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text("+7")
                    .foregroundStyle(.primary)
                
                TextField("000 000-00-00", text: $phoneNumber)
                    .background(Color(.wbTintBG))
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            .background(Color(.wbTintBG))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()

            if isProcessing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                    .scaleEffect(1.5)
                    .padding(.top, 20)
            } else {
                ButtonWBView(title: "Continue", action: {})
            }
            
        }
        .padding()
        .background(.wbBG)
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}


#Preview {
    VerificationView()
}
