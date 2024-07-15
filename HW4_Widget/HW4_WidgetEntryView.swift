//
//  HW4_WidgetEntryView.swift
//  HW4_WidgetExtension
//
//  Created by Ульяна Евстигнеева on 10.07.2024.
//

import Foundation
import WidgetKit
import SwiftUI
import AppIntents

struct HW4_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Online now:")
            Avatar(person: entry.contactShow[entry.index])
            Text(entry.contactShow[entry.index].name + " " + (entry.contactShow[entry.index].surname ?? "") )
            
            Button(intent: ChangeContactIntent(index: entry.index + 1)) {
                Text("Next")
            }
        }
    }
}


