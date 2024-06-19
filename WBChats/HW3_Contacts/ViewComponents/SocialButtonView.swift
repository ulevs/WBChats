//
//  SocialButtonView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 19.06.2024.
//

import SwiftUI

struct SocialButtonView: View {
        let iconName: String
        let action: ()->()
        
        var body: some View {
            Button(action: action) {
                Image(iconName)
                    .padding()
            }
            .frame(height: 40)
            .padding(.horizontal)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.wbDefault, lineWidth: 2)
            )
        }
    }

#Preview {
    SocialButtonView(iconName: "twitter", action: {})
}
