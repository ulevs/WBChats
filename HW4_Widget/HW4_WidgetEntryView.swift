//
//  HW4_WidgetEntryView.swift
//  HW4_WidgetExtension
//
//  Created by Ульяна Евстигнеева on 10.07.2024.
//

import Foundation
import WidgetKit
import SwiftUI

struct HW4_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)

            Text("Online now:")
            Text(entry.configuration.favoriteEmoji)
            
            Button {
                
            } label: {
                Text("next")
            }
        }
    }
}
