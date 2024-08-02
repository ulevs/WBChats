//
//  VerificationCodeView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 29.07.2024.
//

import SwiftUI

//struct VerificationCodeViews: View {
//    @State private var phoneNumber: String = ""
//    @State private var showVerificationCodeView: Bool = false
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            
//            HeadlineTitleView(title: "Enter a code")
//                .padding()
//            
//            TextView(text: "We will send a confirmation code to the number provided")
//                .multilineTextAlignment(.center)
//                .padding(.bottom, 40)
//                .lineSpacing(7)
//
////            NumberView(contact: VerificationModel(phoneNumber: ""))
//            HStack {
//                Text("")
//                
//            }
//            
//            Spacer()
//
//            ButtonWBView(title: "Continue", action: {showVerificationCodeView.toggle()})
//            
//        }
//        .navigationBarBackButtonHidden()
//        .navigationBarItems(
//                        leading: Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                                Image(systemName: "chevron.left")
//                                .bold()
//                                .foregroundStyle(.wbHeadlineFont)
//                        })
//        .padding()
//        .background(Color(.wbBG))
//    }
//}
//
//struct VerificationData: Sequence {
//    var code: String
//    var phoneNumber: String
//
//    // Custom iterator to access each character in the code
//    func makeIterator() -> IndexingIterator<Array<Character>> {
//        return Array(code).makeIterator()
//    }
//}

struct VerificationCodeView: View {
    @State private var phoneNumber: String = ""
//    @State private var showVerificationCodeView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var code: String = ""
    let verificationData = VerificationData(code: "", phoneNumber: "+7 999 999-99-99")
    
    var body: some View {
        VStack {
            Spacer()
            HeadlineTitleView(title: "Enter a code")
                .padding()
            
            TextView(text: "Sent a code to the number")
            TextView(text: verificationData.phoneNumber)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .padding(.top, 7)
            
            
            HStack(spacing: 15) {
                // Convert code string to an array of characters
                ForEach(Array(verificationData.code), id: \.self) { digit in
                    Text(String(digit))
                        .font(.largeTitle)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                // Add placeholders for remaining digits
                ForEach(0..<(4 - verificationData.code.count), id: \.self) { _ in
                    Circle()

                        .foregroundStyle(.wbTintBG)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.bottom, 20)
            
            Button(action: {
                // Resend code action
            }) {
                Text("Запросить код повторно")
                    .foregroundStyle(.wbDefault)
            }
            .padding(.bottom, 50)
            
            Spacer()
//            ButtonWBView(title: "Continue", action: {showVerificationCodeView.toggle()})
            
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

struct VerificationData: Sequence {
    var code: String
    var phoneNumber: String

    // Custom iterator to access each character in the code
    func makeIterator() -> IndexingIterator<Array<Character>> {
        return Array(code).makeIterator()
    }
}
#Preview {
    VerificationCodeView()
}



struct VerificationCodeViewds: View {
    // State variables for code input
    @State private var code: String = ""
    let verificationData = VerificationData(code: "", phoneNumber: "+7 999 999-99-99")
    
    var body: some View {
        VStack {
//            HStack {
//                Button(action: {
//                    // Back button action
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title2)
//                }
//                Spacer()
//            }
//            .padding()
//            
            Spacer()
            HeadlineTitleView(title: "Enter a code")
                .padding()
            
            TextView(text: "Sent a code to the number")
            TextView(text: verificationData.phoneNumber)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .padding(.top, 7)
            
            
            HStack(spacing: 15) {
                // Convert code string to an array of characters
                ForEach(Array(verificationData.code), id: \.self) { digit in
                    Text(String(digit))
                        .font(.largeTitle)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                // Add placeholders for remaining digits
                ForEach(0..<(4 - verificationData.code.count), id: \.self) { _ in
                    Circle()

                        .foregroundStyle(.wbTintBG)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.bottom, 20)
            
            Button(action: {
                // Resend code action
            }) {
                Text("Запросить код повторно")
                    .foregroundStyle(.wbDefault)
            }
            .padding(.bottom, 50)
            
            Spacer()
            
            NumberPad(code: $code)
        }
        .padding()
    }
}

struct NumberPad: View {
    @Binding var code: String
    
    let keys: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0"]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { key in
                        Button(action: {
                            if code.count < 4 {
                                code.append(key)
                            }
                        }) {
                            Text(key)
                                .font(.largeTitle)
                                .frame(width: 70, height: 70)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}
