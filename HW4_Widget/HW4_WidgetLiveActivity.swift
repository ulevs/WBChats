//
//  HW4_WidgetLiveActivity.swift
//  HW4_Widget
//
//  Created by Ульяна Евстигнеева on 22.06.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct HW4_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct HW4_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HW4_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension HW4_WidgetAttributes {
    fileprivate static var preview: HW4_WidgetAttributes {
        HW4_WidgetAttributes(name: "World")
    }
}

extension HW4_WidgetAttributes.ContentState {
    fileprivate static var smiley: HW4_WidgetAttributes.ContentState {
        HW4_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: HW4_WidgetAttributes.ContentState {
         HW4_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: HW4_WidgetAttributes.preview) {
   HW4_WidgetLiveActivity()
} contentStates: {
    HW4_WidgetAttributes.ContentState.smiley
    HW4_WidgetAttributes.ContentState.starEyes
}
