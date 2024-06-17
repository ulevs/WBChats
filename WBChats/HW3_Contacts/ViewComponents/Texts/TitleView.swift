//
//  TitleView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct TitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundStyle(.wbHeadlineFont)
//            .multilineTextAlignment(.center)
        
    }
}

#Preview {
    TitleView(title: "text")
}
