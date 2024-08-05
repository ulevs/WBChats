//
//  TestView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 20.07.2024.
//

import SwiftUI

import Foundation
//

struct NumberView: View {
    @Binding var contact: VerificationModel

    var body: some View {
        HStack(spacing: 8) {
            Text("🇷🇺 +7")
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.wbTintBG)
                )
            
            TextField("000 000-00-00", text: $contact.phoneNumber)
                .keyboardType(.numberPad)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.wbTintBG)
                )
                .onChange(of: contact.phoneNumber) { oldValue, newValue in
                    let formatted = formatPhoneNumber(newValue)
                    if contact.phoneNumber != formatted {
                        contact.phoneNumber = formatted
                    }
                }
        }
        .padding(8)
        .bold()
        .foregroundStyle(.gray)
        .frame(width: 327, height: 36)
    }

    // Format the phone number input
    func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }

        let mask = "XXX XXX-XX-XX"
        var result = ""
        var index = digits.startIndex

        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }

        return result
    }
}
