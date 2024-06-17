//
//  NavigationBarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 16.06.2024.
//

import SwiftUI

import SwiftUI

struct NavigationBarView: View {
    
    let title: String
    let backButton: Bool
    var rightButton: String? = nil
    var rightButtonAction: (() -> Void)?

    
    var body: some View {
        HStack {
            if backButton {
                Button(action: {
//                    DismissAction.self
                }, label: {
                    Image(systemName: "chevron.left")
                        .bold()
                        .foregroundStyle(Color.wbHeadlineFont)
                })
            }
            
          
                TitleView(title: title)
            
            
            Spacer()
            
            if let rightButton = rightButton {
                Button(action: {
                    rightButtonAction?()
                }, label: {
                    Image(systemName: rightButton)
                        .bold()
                        .foregroundStyle(Color.wbHeadlineFont)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
       
    }
}

#Preview {
    NavigationBarView(title: "Контакты", backButton: true)
}
