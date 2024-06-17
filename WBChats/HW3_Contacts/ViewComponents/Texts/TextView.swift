//
//  TextView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct TextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundStyle(.wbHeadlineFont)

    }
}


#Preview {
        TextView(text: "text")

}
