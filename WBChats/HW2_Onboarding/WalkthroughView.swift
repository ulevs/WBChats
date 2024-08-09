//
//  ContentView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI
import UISystem

struct WalkthroughView: View {
    @State private var showPrivacyPolicy = false
    @State private var showTermsOfUse = false
    @State private var showVerificationView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("walkthroughImage")
                    .resizable()
                    .frame(width: 262, height: 271)
                    .padding(.top, 135)
                
                HeadlineTitleView(headlineFont: .wbHeadlineFont, title: "Communicate with friends and family easily")
                    .padding(.top, 42)
                
                Spacer()
                
                Text(NSLocalizedString("By clicking continue I agree to", comment: ""))
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
                
                
                HStack(spacing: 0) {
                    TextButton(isPresented: $showPrivacyPolicy, title: NSLocalizedString("the Privacy Policy", comment: ""))
                        .sheet(isPresented: $showPrivacyPolicy) {
                            PrivacyPolicyView()
                        }
                    
                    Text(" " + NSLocalizedString("and", comment: "") + " ")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                    
                    TextButton(isPresented: $showTermsOfUse, title: NSLocalizedString("Terms of Use", comment: ""))
                        .sheet(isPresented: $showTermsOfUse) {
                            TermsOfUseView()
                        }
                }
                
                ButtonWBView(title: "Start chatting", action: {showVerificationView.toggle()}, buttonColor: .wbButton)
            }
            .navigationDestination(isPresented: $showVerificationView, destination: {
                VerificationView()
            })
            .background(.wbBG)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
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
