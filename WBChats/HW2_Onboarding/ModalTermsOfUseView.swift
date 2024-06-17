//
//  ModalTermsOfUseView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 12.06.2024.
//

import SwiftUI

struct TermsOfUseView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Spacer()
            ButtonWBView(title: "Закрыть"){
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .background(.wbBG)
    }
}

#Preview {
    TermsOfUseView()
}
