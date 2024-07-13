//
//  HW4_Widget.swift
//  HW4_Widget
//
//  Created by Ульяна Евстигнеева on 22.06.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(contactShow: MockData.shared.contacts, index: MockData.shared.index)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(contactShow: MockData.shared.contacts, index: MockData.shared.index)
    }
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let timeline = Timeline(entries: [SimpleEntry(contactShow: MockData.shared.contacts, index: MockData.shared.index)], policy: .atEnd)
        return timeline
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date = .now
    var contactShow: [Contact]
    var index: Int
}



struct HW4_Widget: Widget {
    let kind: String = "HW4_Widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            HW4_WidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

//func whatIndex() -> Int {
////    var index = MockData.shared.contacts
//
//    for i in 0...MockData.shared.contacts.count {
//        guard MockData.shared.index < MockData.shared.contacts.count else {
//            return 0
//        }
//        guard !MockData.shared.contacts[MockData.shared.index].isOnline else {
//            return MockData.shared.index
//        }
//    }
//    
//    return MockData.shared.index
//}


#Preview(as: .systemSmall) {
    HW4_Widget()
} timeline: {
    SimpleEntry(contactShow: Array(MockData.shared.contacts), index: 0)
    SimpleEntry(contactShow: Array(MockData.shared.contacts), index: 0)
}
