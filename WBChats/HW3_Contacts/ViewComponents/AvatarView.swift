//
//  DefoltAvatarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct DefoltAvatarView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.wbButton)
                .frame(width: 48, height: 48)
            Text("NA")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

struct AvatarView: View {
    let avatar: String
    var body: some View {
        Image(avatar)
            .clipShape(RoundedRectangle(cornerRadius: 16))

        
    }
}

#Preview {
//    AvatarView(avatar: "Image")
    DefoltAvatarView()
}
