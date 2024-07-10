//
//  HW4__Widget.swift
//  HW4__Widget
//
//  Created by Ульяна Евстигнеева on 03.07.2024.
//
//
//import WidgetKit
//import SwiftUI
//
//struct Provider: TimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry()
//    }
//
//    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry()
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
////        var entries: [SimpleEntry] = []
////
////        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
////        let currentDate = Date()
////        for hourOffset in 0 ..< 5 {
////            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
////            let entry = SimpleEntry(date: entryDate, emoji: "😀")
////            entries.append(entry)
////        }
//
//        let timeline = Timeline(entries: [SimpleEntry()], policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date = .now
////    let emoji: String
//}
//
//struct HW4__WidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        VStack {
//            Text("Online now:")
//            
////            Text(entry.date, style: .time)
////
////            Text("Emoji:")
////            Text(entry.emoji)
//        }
//    }
//}
//
//struct HW4__Widget: Widget {
//    let kind: String = "HW4__Widget"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration(kind: kind, provider: Provider()) { entry in
//            if #available(iOS 17.0, *) {
//                HW4__WidgetEntryView(entry: entry)
//                    .containerBackground(.fill.tertiary, for: .widget)
//            } else {
//                HW4__WidgetEntryView(entry: entry)
//                    .padding()
//                    .background()
//            }
//        }
//        .configurationDisplayName("Who is online")
//        .description("This is an example widget.")
//    }
//}
//
//#Preview(as: .systemSmall) {
//    HW4__Widget()
//} timeline: {
//    SimpleEntry()
//}
