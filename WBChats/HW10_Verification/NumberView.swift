//
//  TestView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 20.07.2024.
//

import SwiftUI
import Foundation

struct NumberView: View {
//    @Binding var contact: VerificationModel
    @Binding var number: String
    var body: some View {
        HStack(spacing: 8) {
            Text("🇷🇺 +7")
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.wbTintBG)
                )
            
            TextField("000 000-00-00", text: $number)
                .keyboardType(.numberPad)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.wbTintBG)
                )
                .onChange(of: number) { oldValue, newValue in
                    let formatted = formatPhoneNumber(newValue)
                    if number != formatted {
                        number = formatted
                    }
                }
        }
        .bold()
        .foregroundStyle(.gray)
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
