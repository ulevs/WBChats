//
//  GrayTextView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 16.06.2024.
//

import SwiftUI

struct GrayTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundStyle(.gray)
    }

#Preview {
    GrayTextView(text: "text")
}
