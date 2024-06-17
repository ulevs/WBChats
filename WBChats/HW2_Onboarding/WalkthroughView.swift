//
//  ContentView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    @State private var showPrivacyPolicy = false
    @State private var showTermsOfUse = false
    
    var body: some View {
        VStack {
            Image("walktroughImage")
                .resizable()
                .frame(width: 262, height: 271)
                .padding(.top, 135)
            
            HeadlineTextView(title: "Общайтесь с друзьями и близкими легко")
                .padding(.top, 42)
            
            Spacer()
            
            Text("Нажимая кнопку продолжить я соглашаюсь с")
                .font(.system(size: 10))
                .foregroundStyle(.gray)
            
            HStack(spacing: 0) {
                TextButton(isPresented: $showPrivacyPolicy, title: "Политикой Конфиденциальности")
                    .sheet(isPresented: $showPrivacyPolicy) {
                        PrivacyPolicyView()
                    }
                
                Text(" и ")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                
                TextButton(isPresented: $showTermsOfUse, title: "Условиями Использования")
                    .sheet(isPresented: $showTermsOfUse) {
                        TermsOfUseView()
                    }
            }
            
            ButtonWBView(title: "Начать общаться", action: {})
        }
        .background(.wbBG)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TextButton: View {
    @Binding var isPresented: Bool
    let title: String
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text(title)
                .font(.system(size: 10))
                .foregroundStyle(.wbDefault)
        }
    }
}
