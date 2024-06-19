//
//  MoreView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 17.06.2024.
//

import SwiftUI

struct MoreView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("Here is the rest of the information")
    }
}

#Preview {
    MoreView()
}
