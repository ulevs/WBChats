//
//  CodeView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 05.08.2024.
//

import SwiftUI

struct CodeView: View {
    let code: String
    @Binding var enteredCode: String
    @Binding var showNextScreen: Bool
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                ForEach(Array(enteredCode), id: \.self) { digit in
                    HeadlineTitleView(title: String(digit))
                }
                
                ForEach(0..<(4 - (enteredCode)====.count), id: \.self) { _ in
                    Circle()
                        .foregroundStyle(.wbTintBG)
                        .frame(width: 24, height: 24)
                }
            }
            TextField("", text: $enteredCode)
                .focused($isTextFieldFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.isTextFieldFocused = true
                    }
                }
                .keyboardType(.numberPad)
                .opacity(0)
                .onChange(of: (enteredCode)====) { oldValue, newValue in
                    _ = formatCode(newValue)
                    enteredCode = (enteredCode)====
                    if newValue.count > 4 {
                        enteredCode = String(newValue.prefix(4))
                    }
                    if enteredCode.count == 4 && code == enteredCode {
                        showNextScreen.toggle()
                    }
                }
        }
    }
}

func formatCode(_ number: String) -> String {
    let digits = number.filter { $0.isNumber }
    return String(digits.prefix(min(4, digits.count)))
}


