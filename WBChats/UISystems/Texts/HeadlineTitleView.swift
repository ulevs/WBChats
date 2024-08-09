//
//  HeadlineTextView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct HeadlineTitleView: View {
    let title: String
    var body: some View {
        Text(NSLocalizedString(title, comment: ""))
            .font(.system(size: 24))
            .fontWeight(.bold)
            .foregroundStyle(.wbHeadlineFont)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    HeadlineTitleView(title: "text")
}
